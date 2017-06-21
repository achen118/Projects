# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all
CatRentalRequest.destroy_all

c1 = Cat.create!(birth_date: "2000/01/01" , sex:"M", name: "Alex", description:"Good cat.", color: "white")
c2 = Cat.create!(birth_date: "2005/01/01" , sex:"F", name: "Berry", description:"Great cat.", color: "brown")
c3 = Cat.create!(birth_date: "2010/01/01" , sex:"F", name: "Carrie", description:"Very good cat.", color: "orange")
c4 = Cat.create!(birth_date: "2014/06/20" , sex:"M", name: "Dog", description:"Meh cat.", color: "black")

r1 = CatRentalRequest.create!(cat_id:c1.id, start_date: "01/01/2017", end_date: "01/02/2017")
r2 = CatRentalRequest.create!(cat_id:c1.id, start_date: "10/01/2017", end_date: "10/02/2017")
r3 = CatRentalRequest.create!(cat_id:c1.id, start_date: "10/12/2016", end_date: "02/01/2017")
r4 = CatRentalRequest.create!(cat_id:c3.id, start_date: "12/10/2016", end_date: "01/02/2017")
r5 = CatRentalRequest.create!(cat_id:c4.id, start_date: "12/10/2016", end_date: "01/02/2017")
