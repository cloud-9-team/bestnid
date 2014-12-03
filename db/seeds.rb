#encoding: utf-8 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


vendedor1 = User.find_or_create_by(email: "vendedor1_bestnid@gmail.com") do |user|
	user.password = "vendocosas"
	user.password_confirmation = "vendocosas"
	user.first_name = "Carlos"
	user.last_name = "Maidana"
	user.country = "AR"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "1 y 60"
	user.card_1 = "0000"
	user.card_2 = "0000"
	user.card_3 = "0800"
	user.card_4 = "0000"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

vendedor2 = User.find_or_create_by(email: "vendedor2_bestnid@gmail.com") do |user|
	user.password = "vendocosas"
	user.password_confirmation = "vendocosas"
	user.first_name = "Catalina"
	user.last_name = "Perez"
	user.country = "AR"
	user.province = "La Pampa"
	user.city = "Santa Rosa"
	user.domicile = "Santa Rosa al 1600"
	user.card_1 = "1111"
	user.card_2 = "1111"
	user.card_3 = "1111"
	user.card_4 = "1111"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

vendedor3 = User.find_or_create_by(email: "vendedor3_bestnid@gmail.com") do |user|
	user.password = "vendocosas"
	user.password_confirmation = "vendocosas"
	user.first_name = "Sergio"
	user.last_name = "Ramirez"
	user.country = "AR"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "7 y 52"
	user.card_1 = "2222"
	user.card_2 = "2222"
	user.card_3 = "2222"
	user.card_4 = "2222"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

comprador1 = User.find_or_create_by(email: "comprador1_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Ramiro"
	user.last_name = "Lamas"
	user.country = "AR"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "No me acuerdo"
	user.card_1 = "3333"
	user.card_2 = "3333"
	user.card_3 = "3333"
	user.card_4 = "3333"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

comprador2 = User.find_or_create_by(email: "comprador2_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Mariano"
	user.last_name = "Petrucci"
	user.country = "AR"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "Bosque"
	user.card_1 = "4444"
	user.card_2 = "4444"
	user.card_3 = "4444"
	user.card_4 = "4444"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

comprador3 = User.find_or_create_by(email: "comprador3_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Mabel"
	user.last_name = "Rimano"
	user.country = "AR"
	user.province = "Chubut"
	user.city = "Puerto Madryn"
	user.domicile = "Nadando con las ballenas"
	user.card_1 = "5555"
	user.card_2 = "5555"
	user.card_3 = "5555"
	user.card_4 = "5555"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

comprador4 = User.find_or_create_by(email: "comprador4_bestnid@gmail.com") do |user|
	user.password = "comprocosas"
	user.password_confirmation = "comprocosas"
	user.first_name = "Roberto"
	user.last_name = "Vegas"
	user.country = "AR"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "Muy complicado de describir"
	user.card_1 = "6666"
	user.card_2 = "6666"
	user.card_3 = "6666"
	user.card_4 = "6666"
	user.card_owner_first_name = "Nombre"
	user.card_owner_last_name = "Apellido"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

admin = User.find_or_create_by(email: "admin1_bestnid@gmail.com") do |user|
	user.password = "administrador"
	user.password_confirmation = "administrador"
	user.first_name = "José María"
	user.last_name = "Lucero"
	user.country = "AR"
	user.province = "Buenos Aires"
	user.city = "La Plata"
	user.domicile = "---"
	user.card_1 = "0000"
	user.card_2 = "0000"
	user.card_3 = "0000"
	user.card_4 = "0000"
	user.card_owner_first_name = "José María"
	user.card_owner_last_name = "Lucero"
	user.security_code = "000"
	user.expires_on = "2015-12-01"
end

c1 = Category.find_or_create_by(name: "Hogar");
c2 = Category.find_or_create_by(name: "Herramientas de trabajo");
c3 = Category.find_or_create_by(name: "Animales");
c4 = Category.find_or_create_by(name: "Otros");

guante = vendedor1.products.find_or_create_by(title: "Guante de acero",
	description: "Guante de malla de acero inox. tejido, anticorte, marca *manulatex* de industria francesa",
	imageURL: "http://40.media.tumblr.com/6bc78e251e463fb68362d168fcf38bda/tumblr_nbqngpEAks1tlipbuo1_1280.jpg",
	visitCount: 0,
	category: c2,
	created_at: "2014-11-16 08:00:00",
	ends_at: "2014-12-01 08:00:00")

llama = vendedor2.products.find_or_create_by(title: "Llama",
	description: "Llama adulta oriunda de Tilcara. Es mansita",
	imageURL: "http://41.media.tumblr.com/6750bde49985d14340294b65cbfac7a2/tumblr_nbsedz4pML1tlipbuo1_1280.jpg",
	visitCount: 0,
	category: c3,
	created_at: "2014-11-16 08:00:00",
	ends_at: "2014-12-06 08:00:00")

espejo = vendedor1.products.find_or_create_by(title: "Espejo",
	description: "Espejo sin marco. Medidas: 0.8m x 1.2m",
	imageURL: "http://40.media.tumblr.com/ad056adadfeeced7f24f918a843a0f60/tumblr_nbsf4rGZFE1tlipbuo1_1280.jpg",
	visitCount: 0,
	category: c1,
	created_at: "2014-11-16 08:00:00",
	ends_at: "2014-12-01 08:00:00")

kriptonita = vendedor2.products.find_or_create_by(title: "Kriptonita",
	description: "200 gramos de Kriptonita",
	imageURL: "http://41.media.tumblr.com/8e08757ed8fd1c3368e29dc127140ef1/tumblr_nbsewqvU231tlipbuo1_1280.jpg",
	visitCount: 0,
	category: c4,
	created_at: "2014-11-16 08:00:00",
	ends_at: "2014-12-14 08:00:00")

aceite = vendedor3.products.find_or_create_by(title: "Aceite y Vinagre",
	description: "200ml de aceite y 300ml de vinagre. No incluye frascos",
	imageURL: "http://40.media.tumblr.com/f92d39b2c62cf2bc5398797db35ce37d/tumblr_nbsejfmSt21tlipbuo1_400.jpg",
	visitCount: 0,
	category: c1,
	created_at: "2014-11-07 08:00:00",
	ends_at: "2014-11-22 08:00:00")

nutria = vendedor1.products.find_or_create_by(title: "Nutria",
	description: "Las nutrias son adorables criaturas que viven tanto en la tierra como en el agua y a menudo se les confunde con los castores.\n
				  Viven, principalmente, en tierras cerca de cuerpos de agua, y cazan su comida tanto en el agua, incluyendo a los peces, como en tierra, incluidas las aves.",
	imageURL: "http://wikifaunia.com/images/3/3b/Nutria1.jpg",
	visitCount: 0,
	category: c3,
	created_at: "2014-11-10 08:00:00",
	ends_at: "2014-11-25 08:00:00")

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

comprador1.bids.find_or_create_by(product: nutria,
	need: "Unos de mis objetivos en la vida es tener una nutria. Esta nutria hará feliz a una persona.",
	value: 3)

comprador2.bids.find_or_create_by(product: nutria,
	need: "Necesito una nutria para que juegue con mis hijos. La pidieron para navidad",
	value: 500)

comprador3.bids.find_or_create_by(product: nutria,
	need: "Tengo un nutrio y necesita compañia, ayudalo por favor",
	value: 200)

comprador4.bids.find_or_create_by(product: nutria,
	need: "Es ideal para el tapado de nutria que ando buscando",
	value: 5000)

p1 = comprador3.questions.find_or_create_by(product: kriptonita,
	body: "¿Cuál es su pureza?")

p2 = comprador1.questions.find_or_create_by(product: kriptonita,
	body: "Hola soy Ramiro, tengo algunas dudas.. ¿viene en color azul? ¿cuánto me sale el envío a la Tierra?")

p3 = comprador2.questions.find_or_create_by(product: llama,
	body: "Se le pueden enseñar truquitos como hacerse la muerta o saltos?")

p1.create_answer(body: "100% pura, deja a Superman dado vuelta")

p3.create_answer(body: "Sí, hace todo lo que le pidas")