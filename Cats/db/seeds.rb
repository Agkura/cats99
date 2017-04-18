# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create(birth_date: '2015/08/20', color: "black", name: "Gry", sex: "M", description: "A fun cat!" )
cat2 = Cat.create(birth_date: '2014/09/20', color: "orange", name: "Gray", sex: "F", description: "A fun cat!" )
cat3 = Cat.create(birth_date: '2015/10/20', color: "rainbow", name: "Bob", sex: "M", description: "A fun cat!" )
cat4 = Cat.create(birth_date: '2015/07/10', color: "blonde", name: "Samantha", sex: "F", description: "A fun cat!" )
cat5 = Cat.create(birth_date: '2010/05/10', color: "green", name: "Huo", sex: "M", description: "A fun cat!" )
cat6 = Cat.create(birth_date: '1980/02/12', color: "white", name: "GWow", sex: "M", description: "A fun cat!" )
