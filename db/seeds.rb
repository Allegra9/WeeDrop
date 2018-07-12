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
Seller.create(name: "Chocolate Hai", address: "131 Finsbury Pavement", postcode: "E14 1NT" )

user1 = User.create(username: 'testb', password: '1234567', is_seller: false)
buyer1 = Buyer.create(name: 'TestBuyer')
user1.class_id = buyer1.id
user1.save

user2 = User.create(username: 'tests', password: '1234567', is_seller: true)
seller1 = Seller.create(name: 'TestSeller', address: 'Anything', postcode: 'N1 7RF')
user2.class_id = seller1.id
user2.save

# Products to have seller's id, 1-6, and ...
# name, price, descr, img_url ?

Product.create(name: "Harlequin GDP - 3:1 CBD", price: "15.00", description: "Known by many names, Harlequin GDP is a CBD-dominant cross of Harlequin and Granddaddy Purple. ", seller_id: 1 )
Product.create(name: "ACDC x Lemon Banana Sherbert 1:1 (CBD)", price: "15.00", description: "", seller_id: 1 )
Product.create(name: "Lono Haze (CBD)", price: "15.00", description: "", seller_id: 1 )

Product.create(name: "Super Silver Haze (Sativa)", price: "15.00", description: "Super Silver Haze is a sativa cousin of Super Lemon Haze.", seller_id: 2 )
Product.create(name: "Acapulco Gold(Sativa)", price: "15.00", description: "", seller_id: 2 )
Product.create(name: "Panama Red (Sativa)", price: "15.00", description: "Panama Red is an old-school cannabis classic. ", seller_id: 2 )
Product.create(name: "Lamb's Bread (Sativa)", price: "15.00", description: "Lamb's Bread, also known as Lamb's Breath, is a well-known and pungent sativa strain.", seller_id: 2 )

Product.create(name: "Blue Cookies (Indica)", price: "15.00", description: "Blue Cookies is an 80/20 indica-dominant hybrid cross between Girl Scout Cookies and Blueberry.", seller_id: 3 )
Product.create(name: "Granddaddy Purple (Indica)", price: "15.00", description: "Granddaddy Purple (or GDP) is a famous indica cross between Purple Urkle and Big Bud.", seller_id: 3 )
Product.create(name: "Organic OG (Indica)", price: "15.00", description: "", seller_id: 3 )

Product.create(name: "Cinderella 99 (Hybrid)", price: "12.00", description: "Cinderella 99, otherwise known as 'C99' or simply 'Cindy', is a sativa-dominant hybrid best known for her potent cerebral high and sweet fruity flavors.", seller_id: 4 )
Product.create(name: "THC Bomb (Hybrid)", price: "15.00", description: "", seller_id: 4 )
Product.create(name: "Cherry Diesel (Hybrid)", price: "15.00", description: "Cherry Diesel is a 50/50 hybrid of Cherry OG and Turbo Diesel.", seller_id: 4 )
Product.create(name: "Pineapple Kush (Hybrid)", price: "12.00", description: "Pineapple Kush is a cross between Pineapple and Master Kush.", seller_id: 4 )

Product.create(name: "Ganja Goddess Raw Cacao Roses (Vegan)", price: "17.00", description: "Ganja Goddess Cacao Raw Roses are vegan, with 60mg THC per package (20mg THC per rose).", seller_id: 5 )
Product.create(name: "Ganja Goddess Gingerbread", price: "10.00", description: "3 in a pack. Ganja Goddess Gingerbread uses a unique blend of hybrid strains to produce a potent medical marijuana edible.", seller_id: 5 )
Product.create(name: "Ganja Goddess Brownies", price: "10.00", description: "3 in a pack. Ganja Goddess Brownies are a classic favorite that combines indica, sativa, and gourmet baking to make a very strong and delicious edible.", seller_id: 5 )

Product.create(name: "Cheeba Chews", price: "12.00", description: "Sativa (Orange) 70mg THC", seller_id: 6 )
Product.create(name: "PJ Budders Belgian Chocolate Bars", price: "11.00", description: "PJ Budders - Milk Chocolate (150mg)", seller_id: 6 )
Product.create(name: "LiquidGold Chocolate Bars", price: "22.00", description: "LiquidGold - Almond Nut Toffee Bar", seller_id: 6 )
