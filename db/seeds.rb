# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = Admin.find_or_initialize_by(email: 'test@columbia.edu')
user.full_name = 'testing'
user.uid = '1111'
user.id = 100
user.save!