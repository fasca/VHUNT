# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Detruire tout ce qui est en base
Product.destroy_all

#puis on créé des seed, le "!" permet de lever une exception si la seed ne passe pas a cause 
#d'une validation par exemple
Product.create!(name: "Kudoz", url: "http://www.site.com", tagline: "tinder for job search", category: "tech")
Product.create!(name: "kamehameha", url: "http://www.kamehouse.com", tagline: "atk of goku", category: "education")
Product.create!(name: "shumpo", url: "http://www.fly.com", tagline: "fast run", category: "design")