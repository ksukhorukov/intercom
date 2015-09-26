#!/usr/bin/env ruby
require 'pp'

def flatten(a)
  result = []
  a.each do |elem|
    if elem.kind_of? Array 
      result = result + flatten(elem) unless elem.empty?
    else 
      result << elem
    end
  end
  result
end


test = [1,[2,3,4],5,[]]
result = flatten(test)
pp result
