#encoding: utf-8 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#vendedor1 = User.create!(email: "vendedor1_de_bestnid@gmail.com", password: "vendocosas", password_confirmation: "vendocosas", first_name: "Carlos", last_name: "Maidana", country: "Argentina", province: "Buenos Aires", city: "La Plata", domicile: "1 y 60", card_1: "5000", card_2: "0666", card_3: "0800", card_4: "1111")

vendedor1 = User.find_or_create_by(email: "vendedor1_bestnid@gmail.com") do |user|
	user.password = "vendocosas"
	user.password_confirmation = "vendocosas"
	user.first_name = "Carlos"
	user.last_name = "Maidana"
	user.country = "Argentina"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "1 y 60"
	user.card_1 = "0000"
	user.card_2 = "0000"
	user.card_3 = "0800"
	user.card_4 = "0000"
end

vendedor2 = User.find_or_create_by(email: "vendedor2_bestnid@gmail.com") do |user|
	user.password = "vendocosas"
	user.password_confirmation = "vendocosas"
	user.first_name = "Catalina"
	user.last_name = "Perez"
	user.country = "Argentina"
	user.province = "La Pampa"
	user.city = "Santa Rosa"
	user.domicile = "Santa Rosa al 1600"
	user.card_1 = "1111"
	user.card_2 = "1111"
	user.card_3 = "1111"
	user.card_4 = "1111"
end

vendedor3 = User.find_or_create_by(email: "vendedor3_bestnid@gmail.com") do |user|
	user.password = "vendocosas"
	user.password_confirmation = "vendocosas"
	user.first_name = "Sergio"
	user.last_name = "Ramirez"
	user.country = "Argentina"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "7 y 52"
	user.card_1 = "2222"
	user.card_2 = "2222"
	user.card_3 = "2222"
	user.card_4 = "2222"
end

comprador1 = User.find_or_create_by(email: "comprador1_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Ramiro"
	user.last_name = "Lamas"
	user.country = "Argentina"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "No me acuerdo"
	user.card_1 = "3333"
	user.card_2 = "3333"
	user.card_3 = "3333"
	user.card_4 = "3333"
end

comprador2 = User.find_or_create_by(email: "comprador2_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Mariano"
	user.last_name = "Petrucci"
	user.country = "Argentina"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "Bosque"
	user.card_1 = "4444"
	user.card_2 = "4444"
	user.card_3 = "4444"
	user.card_4 = "4444"
end

comprador3 = User.find_or_create_by(email: "comprador3_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Mabel"
	user.last_name = "Rimano"
	user.country = "Argentina"
	user.province = "Chubut"
	user.city = "Puerto Madryn"
	user.domicile = "Nadando con las ballenas"
	user.card_1 = "5555"
	user.card_2 = "5555"
	user.card_3 = "5555"
	user.card_4 = "5555"
end

comprador4 = User.find_or_create_by(email: "comprador4_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Roberto"
	user.last_name = "Vegas"
	user.country = "Argentina"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "Muy complicado de describir"
	user.card_1 = "6666"
	user.card_2 = "6666"
	user.card_3 = "6666"
	user.card_4 = "6666"
end

admin = User.find_or_create_by(email: "admin1_bestnid@gmail.com") do |user|
	user.password = "administro"
	user.password_confirmation = "administro"
	user.first_name = "José María"
	user.last_name = "Lucero"
	user.country = "Argentina"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "Por ahí"
	user.card_1 = "7777"
	user.card_2 = "7777"
	user.card_3 = "7777"
	user.card_4 = "7777"
end

guante = vendedor1.products.find_or_create_by(title: "Guante de acero",
	description: "Guante de malla de acero inox. tejido, anticorte, marca *manulatex* de industria francesa",
	imageURL: "",
	totalDays: 15,
	visitCount: 0,
	created_at: "2014-02-05 00:00:00")

llama = vendedor2.products.find_or_create_by(title: "Llama",
	description: "Llama adulta oriunda de Tilcara. Es mansita",
	imageURL: "",
	totalDays: 20,
	visitCount: 0,
	created_at: "2014-03-06 17:00:00")

espejo = vendedor1.products.find_or_create_by(title: "Espejo",
	description: "Espejo sin marco. Medidas: 0.8m x 1.2m",
	imageURL: "",
	totalDays: 15,
	visitCount: 0,
	created_at: "2014-04-07 08:31:03")

kriptonita = vendedor2.products.find_or_create_by(title: "Kriptonita",
	description: "200 gramos de Kriptonita",
	imageURL: "",
	totalDays: 28,
	visitCount: 0,
	created_at: "2014-05-08 23:00:00")

aceite = vendedor3.products.find_or_create_by(title: "Aceite y Vinagre",
	description: "200ml de aceite y 300ml de vinagre. No incluye frascos",
	imageURL: "",
	totalDays: 15,
	visitCount: 0,
	created_at: "2014-06-09 11:11:11")

comprador1.bids.find_or_create_by(product: guante,
	need: "Soy carnicero y lamentablemente perdí un dedo trabajando. Me gustaría comprar el producto para que no me vuelva a ocurrir.",
	value: 50)

comprador2.bids.find_or_create_by(product: llama,
	need: "Siempre me gustaron los animales porque vivo solo y son buena compañia. Una llama es justo lo que necesito.",
	value: 507.6)

comprador1.bids.find_or_create_by(product: espejo,
	need: "Siempre quise ser vampiro. Con este espejo no me convertiría en vampiro pero me ayudaría a sentirme uno.",
	value: 3.1416)

comprador3.bids.find_or_create_by(product: kriptonita,
	need: "Odio a superman y si algún día lo llego a cruzar este producto me vendría al pelo.",
	value: 2000)

comprador4.bids.find_or_create_by(product: guante,
	need: "Soy carpintero y la necesito para cuando manejo la sierra.",
	value: 5000)

p1 = comprador3.questions.find_or_create_by(product: kriptonita,
	body: "¿Cuál es su pureza?")

p2 = comprador1.questions.find_or_create_by(product: kriptonita,
	body: "Hola soy Ramiro, tengo algunas dudas.. ¿viene en color azul? ¿cuánto me sale el envío a la Tierra?")

p3 = comprador2.questions.find_or_create_by(product: llama,
	body: "Se le pueden enseñar truquitos como hacerse la muerta o saltos?")

p1.create_answer(body: "100% pura, hace delirar tus sentidos")

p3.create_answer(body: "Sí, hace todo lo que le pidas")