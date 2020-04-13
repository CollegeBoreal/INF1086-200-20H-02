

# Seive

from itertools import count, takewhile

def primes():
  def sieve(numbers):
      head = next(numbers)
      yield head 
      yield from sieve(n for n in numbers if n % head)
  return sieve(count(2))

#list(takewhile(lambda x: x < 40, primes() ))

