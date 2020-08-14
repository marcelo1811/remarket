# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'byebug'

puts 'Iniciando Seed'

puts 'Criando User...'
user = User.create({
  first_name: 'Marcelo',
  last_name: 'Miyachi',
  email: 'marcelo@test.com',
  password: '123123'
})
puts 'User criado com sucesso!'



puts 'Criando Store...'
store = Store.create({
  user: user,
  name: 'Máscaras Bellacris',
  description: 'Fazemos máscaras de ótima qualidade',
  terms: 'Para vender nossos produtos, whatsapp 123123'
})
puts 'Store criada com sucesso!'



puts 'Criando Produto...'
variant = {
  price: 700,
  name: 'Tamanho - P'
}

product = Product.create!({
  store: store,
  name: 'Máscara Flores',
  description: 'Máscara de neoprene com bico de pato',
  is_active: true,
  variants: [
    variant
  ]
})
puts 'Product criado com sucesso!'


# puts 'Anexando photo...'
# file = URI.open('https://images.tcdn.com.br/img/img_prod/680735/mascara_lisa_preta_1520_1_20200426141353.jpg')
# product.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# puts 'Photo anexada com sucesso'



puts 'Criando ProductVariant...'
ProductVariant.create({
  product: product,
  price: 1000,
  name: 'Tamanho - M'
})
puts 'ProductVariant criado com sucesso!'



puts 'Criando Catalogue...'
catalogue = Catalogue.create({
  user: user,
  name: user.slug
})
puts 'Catalogue criado com sucesso!'



puts 'Criando ProductCatalogue...'
product_catalogue = ProductCatalogue.create({
  product: product,
  catalogue: catalogue,
  margin: 5000,
  is_active: true
})
puts 'ProductCatalogue criado com sucesso!'

puts 'Seed finalizado!'
