# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create({
  first_name: 'Marcelo',
  last_name: 'Miyachi',
  email: 'marcelo@test.com',
  password: '123123'
})

store = Store.create({
  user: user,
  name: 'Máscaras Bellacris',
  description: 'Fazemos máscaras de ótima qualidade',
  terms: 'Para vender nossos produtos, whatsapp 123123'
})


variant = {
  price: 700,
  name: 'Tamanho - P'
}

product = Product.create({
  store: store,
  name: 'Máscara Flores',
  description: 'Máscara de neoprene com bico de pato',
  is_active: true,
  variants: [
    variant
  ]
})

ProductVariant.create({
  product: product,
  price: 1000,
  name: 'Tamanho - M'
})

catalogue = Catalogue.create({
  user: user,
  name: user.slug
})

product_catalogue = ProductCatalogue.create({
  product: product,
  catalogue: catalogue,
  comission: 5000,
  is_active: true
})

