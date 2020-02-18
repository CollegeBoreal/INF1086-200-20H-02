# -*- coding: utf-8 -*-
"""
Created on Tue Feb 11 10:07:57 2020

@author: User
"""

function set_country(country_code, country_name) {
  let shipping_text

  const title = $(window).width() > 450 ? country_name : country_code

  switch(country_code){
    case 'US':
      shipping_text = free_shipping_message(title, '$15')
      break
    case 'GB':
      shipping_text = free_shipping_message(title, '£75')
      break
    case 'CA':
      shipping_text = free_shipping_message(title, '$60')
      break
    case 'AE':
      shipping_text = 'We ship to the UAE'
      break
    case 'SA':
      shipping_text = 'We ship to the KSA'
      break
    case 'IP':
    case 'KP':
      shipping_text = `Sorry, we do not ship to ${title}`
      break
    default:
      shipping_text = `We Ship to ${title}`
  }

  $('.product-shipping').text(shipping_text);
  $('.cart-shipping-text').text(shipping_text);
  $('.shipping-notification-text').text(shipping_text);
  $('.cart .country').text(shipping_text);

  if (country_code === 'GB' ) {
    $('#announcement-bar').text('Orders over £75 ship FREE')
  } else if (country_code === 'CA') {
    $('#announcement-bar').text('Orders over 60 CAD ship FREE')
  } else {
    $('#announcement-bar').remove()
    $('#nav-new').removeClass('mt4')
    $('.mobile-account-header.selective-account-header').removeClass('mt5')
    $('header.mobilemain').removeClass('mt4')
    if ($('.product-nav')) {
      $('.product-nav').removeClass('mt-5-5-l')
      $('.product-nav').addClass('mt5')
    }
  }

  $('body').append('<span class="shipping-text" style="display: none;">' + shipping_text +'</span>')

}

function free_shipping_message(country, price) {
  return `Free shipping to ${country} ${price}+`
}

$(function() {
  if ($.cookie('country_code') == null) {
    $.ajax({
      url: 'https://api.ipstack.com/check?access_key=ac2ee23a92f61c39223e2da417762f65',
      type: 'GET',
      success: function(location) {
        const { country_code, country_name } = location
        set_country(country_code, country_name)
        $.cookie('country_code', country_code)
        $.cookie('country_name', country_name)
      }
    });
  } else {

    set_country($.cookie('country_code'), $.cookie('country_name'))
  }
});