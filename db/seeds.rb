# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = Admin.find_by_email(email = 'rubykurs@example.com') || Admin.create!(email: email, password: 'rubyrocks')
puts "admin created", a.inspect
m = Member.find_by_email(email = 'oma@example.com') ||
  Member.create!(email: email, password: 'rubyrocks',
   name: "Ole Morten Heggebakken Amundsen",
   address: 'Gamlevegen 17',
   city: 'Porsgrunn',
   postcode: '3922',
   country: 'Norge'
   )
puts "member created", m.inspect