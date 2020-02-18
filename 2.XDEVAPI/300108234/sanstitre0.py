# -*- coding: utf-8 -*-
"""
Created on Tue Feb 11 10:04:32 2020

@author: Halima
"""

function initialize_loop() {
    Loop.setKey('8a1a0a9495a4c849f93544cf0aa4c86e4ab5da65');
    const loop_cart = getLoopCart()

    if(loop_cart.length === 0) {
            if(localStorage.getItem('old_loop_cart')){
                const old_cart = JSON.parse(localStorage.getItem('old_loop_cart'))
                if(new Date().getTime() <= parseInt(old_cart.expires))
                 setLoopCart(old_cart.cart)
                localStorage.removeItem('old_loop_cart')
            } else {
                emptyCart()
            }
    }

}

function addLoopItem(form, i = 0) {
    if(localStorage.getItem('loop_token')) localStorage.removeItem('loop_token')


    const id = i ? i : findProductID(form)
    let loopCart = getLoopCart()
    if (!loopCart.length) {
        loopCart = [parseInt(id)]
    } else {
        loopCart.push(parseInt(id))
    }
    setLoopCart(loopCart)
}

function update_loop_item(id, quantity) {
    const loop_cart = getLoopCart()

    const edited_cart = loop_cart.filter(e => e !== id)

    for(let i = 0; i < quantity; i++)
        edited_cart.push(id)

    setLoopCart(edited_cart)
}

function findProductID(form) {
    const formArray = form.serializeArray()
    for (let i = 0; i < formArray.length; i++) {
        if (formArray[i].name === 'id') {
            return formArray[i].value

        }
    }
}

function setLoopCart(loop_cart) {
    localStorage.setItem('loop_cart', JSON.stringify(loop_cart))
    update_loop_bar()
}

function getLoopCart() {
    if(localStorage.getItem('loop_cart'))
        return JSON.parse(localStorage.getItem('loop_cart'))

    return []
}

function emptyCart() {
    $.ajax({
          url: '/cart/clear',
          method: 'post',
          cached: false,
          async: false,
          error: function(data) {
            console.debug('error', data)
          }
        })
}

function update_loop_bar() {
    $('#LRS-wrapper').css('background', '#222')
    $.ajax('/cart.js', {
        method: 'get',
        dataType:'json',
        success: function(data){
            const base_price = Loop.data.loop_base
            let new_balance = pad_price((base_price - data.total_price)/100)
            $('#LRS-amount').empty()
            if(parseFloat(new_balance) < 0 ){
                 $('#LRS-copy p').text('balance due')
                 new_balance = pad_price(new_balance * -1)
            }else
            $('#LRS-copy p').text('in available credit')


            $('#LRS-amount').append(window.currency + new_balance)
        },
        error: function(error) {
            console.debug('you got an error', error)
        }
    })
}

function pad_price(amount){
    const str = amount.toString().split('.')

    if(str.length > 1) {
        return str[0] + '.' + ('00' + str[1]).slice(-2)
    }

    return str[0] + '.00'
}

function navigateToLoop() {
    const cart = getLoopCart()

    if (cart) {

        //set cookies to expire in an hour, just in case user wants to return to shop after sent to return consolidation
        const expires = new Date().getTime() + (60 * 60 * 1000)

            localStorage.setItem('old_loop_cart', JSON.stringify({
                cart,
                expires
            }))
        const has_token = localStorage.getItem('loop_token')

        if(has_token){
            localStorage.removeItem('loop_cart')
            window.location = `https://returns.hautehijab.com/#/cart/${has_token}`
        }


        $.ajax({
            method: 'POST',
            url: 'https://api.loopreturns.com/api/v1/cart/',
            dataType: 'json',
            data: JSON.stringify({
                cart: cart
            }),
            headers: {
                "content-type": 'application/json',
                "x-authorization": '8a1a0a9495a4c849f93544cf0aa4c86e4ab5da65',
            },
            success: function (data) {
                if(data.errors) {
                    // here we should show an error message just in case loop returns an error
                    return
                }

                localStorage.removeItem('loop_cart')
                localStorage.setItem('loop_token', data.token)
                window.location = `https://returns.hautehijab.com/#/cart/${data.token}`
            },
            error: function (e) {
                console.debug('error', e.error)
            },
            cache: false,
            async: false
        })

    }
}