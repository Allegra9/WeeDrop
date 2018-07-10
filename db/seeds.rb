# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Seller.create(name: "CBD KinG", address: "125 Soho", postcode: "W1F 7SQ" )
Seller.create(name: "Sativa Heaven", address: "79 Riverside Rd", postcode: "SW6 6WU" )
Seller.create(name: "Indica Shop", address: "100 Richmond Rd", postcode: "TW10 5HZ" )
Seller.create(name: "Cindarella 99", address: "99 Cindy Street", postcode: "KT2 5LU" )
Seller.create(name: "Ganja Goddess Bakes", address: "23 Finchley Rd", postcode: "N2 5TH" )
Seller.create(name: "Chocolate Hai", address: "131 Finsbury Pavament", postcode: "EC2A 1NT" )

# Products to have seller's id, 1-6, and ...
# name, price, descr, img_url ?

Product.create(name: "Super Silver Haze (Sativa)", price: "15.00", description: "Super Silver Haze is a sativa cousin of Super Lemon Haze that first rose to prominence in the late 90s.", seller_id: 2 )
