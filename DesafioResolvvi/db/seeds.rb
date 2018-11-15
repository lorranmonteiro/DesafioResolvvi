# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lawyer.create!(name: "Yasmin Corrêa Mendonça", state: "CE", order: "1")
Lawyer.create!(name: "Arthur Melo Campus", state: "SP", order: "1")
Lawyer.create!(name: "Jesus Fernandéz Guimarães", state: "PE", order: "1")
Lawyer.create!(name: "Bruno Sampaio da Silva", state: "CE", order: "2")
Lawyer.create!(name: "Daiana Paulino Monteiro", state: "RJ", order: "1")
Lawyer.create!(name: "Sabrina Sá Sturdart", state: "RS", order: "1")
Lawyer.create!(name: "Maria Luiza de Souza", state: "PE", order: "2")
Lawyer.create!(name: "João Paulo de Castro Carneiro", state: "RS", order: "2")
Lawyer.create!(name: "Saulo Rodrigues Londres", state: "SP", order: "2")
Lawyer.create!(name: "Ana Paula de Carvalho Silva", state: "RJ", order: "2")

ce = State.create!(name: "CE", interaction: "1")
rj = State.create!(name: "RJ", interaction: "1")
sp = State.create!(name: "SP", interaction: "1")
rs = State.create!(name: "RS", interaction: "1")
pe = State.create!(name: "PE", interaction: "1")