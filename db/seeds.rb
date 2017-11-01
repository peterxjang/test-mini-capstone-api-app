# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Supplier.create(name: "Mars", email: "mars@email.com", phone: "132432423")
Supplier.create(name: "Nabisco", email: "nabisco@email.com", phone: "3243424")

Product.create(name: "Starburst", price: "1", description: "Starburst is the brand name of a box-shaped, fruit-flavored soft taffy candy manufactured by The Wrigley Company, a subsidiary of Mars, Incorporated", supplier_id: 1)
Product.create(name: "Snickers", price: "2", description: "Snickers is a brand name chocolate bar made by the American company Mars, Incorporated", supplier_id: 1)
Product.create(name: "Oreos", price: "4", description: "Oreo is a commercial brand of cookie usually consisting of two chocolate wafers with a sweet creme filling in between", supplier_id: 2)

Image.create(product_id: 1, url: "https://www.oldtimecandy.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/t/starburst-original-pkg.jpg")
Image.create(product_id: 1, url: "https://www.oldtimecandy.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/t/starburst-candy.jpg")
Image.create(product_id: 1, url: "https://cdn3.volusion.com/crwxq.xtpya/v/vspfiles/photos/FE897-2.jpg?1455281736")
Image.create(product_id: 2, url: "https://images-na.ssl-images-amazon.com/images/I/71%2Br1gAwsZL._SX466_.jpg")
Image.create(product_id: 3, url: "http://lchaimfoods.com/wp-content/uploads/2016/08/oreos.jpg")
Image.create(product_id: 3, url: "http://images.mentalfloss.com/sites/default/files/oreosprimary.png")
