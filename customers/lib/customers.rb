#!/usr/bin/env ruby

require 'json'
require 'pp'

def convert_to_radians(a)
  ( a * 3.14 ) / 180.0
end

def distance(lat1, long1, lat2, long2)
  #puts "Distance calculation: #{lat1} #{long1} #{lat2} #{long2}"

  central_angle = Math.acos(Math.sin(lat1)*Math.sin(lat2) + Math.cos(lat1)*Math.cos(lat2) * Math.cos(long1 - long2))
  dst = central_angle * 6371.0  #radius of the earth
end

def far_away(lat1, long1, lat2, long2, max_distance)
  if distance(lat1, long1, lat2, long2) > max_distance 
    true
  else
    false
  end
end


file_path = './data/customers.json'
data = File.read(file_path)
counter = 0
data.each_line do |client|
  client = JSON.parse client
  name = client["name"]
  user_id = client["user_id"]

  latitude1 = convert_to_radians(client["latitude"].to_f)
  latitude2 = convert_to_radians(53.3381985)
  longitude1 = convert_to_radians(client["longitude"].to_f)
  longitude2 = convert_to_radians(-6.2592576)

  if not far_away(latitude1, longitude1, latitude2 , longitude2, 100)
    counter += 1
    puts "\nWelcome to the party!\n\n" if counter == 1
    puts "#{counter}) #{name} - #{user_id}" 
  end
end


# p distance(52.986375,-6.043701, 53.3381985, -6.2592576)




