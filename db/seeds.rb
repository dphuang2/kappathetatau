# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.create_admin
employer = CreateAdminService.new.create_employer
puts 'CREATED ADMIN USER: ' << user.email
puts 'CREATED EMPLOYER USER: ' << employer.email
