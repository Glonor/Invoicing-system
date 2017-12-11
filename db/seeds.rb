# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name:  'Admin',
             last_name: 'User',
             email: 'admin@example.com',
             password:              'password',
             password_confirmation: 'password',
             admin: true,
             fiscal_code: 'QWERTYUIOPLKJHGF',
             address: 'Via Rosmini 3',
             city: 'Trento',
             district: 'Trento',
             postal_code: '38121',
             phone: '2456812456')
