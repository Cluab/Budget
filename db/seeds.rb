# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(name: "Alice")
User.create!(name: "Bob")
User.create!(name: "Charlie")

# Exchanges
Exchange.create!(name: "Food expenses", amount: 100, author_id: 1)
Exchange.create!(name: "Transport expenses", amount: 50, author_id: 2)
Exchange.create!(name: "Entertainment expenses", amount: 75, author_id: 3)

# Groups
Group.create!(name: "Roommates", icon: "🏠", user_id: 1)
Group.create!(name: "Coworkers", icon: "💼", user_id: 2)
Group.create!(name: "Friends", icon: "🎉", user_id: 3)
