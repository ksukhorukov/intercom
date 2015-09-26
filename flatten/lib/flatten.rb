#!/usr/bin/env ruby

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

