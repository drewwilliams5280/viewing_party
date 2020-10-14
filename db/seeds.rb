# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
drewni = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
hank = User.create(name: "Hank Hill", email: "hank@email.com", password: "123")
homer = User.create(name: "Homer Simpson", email: "homer@email.com", password: "123")

friendship1 = Friendship.create(friend: drewni, user: hank)
friendship2 = Friendship.create(friend: hank, user: drewni)

friendship3 = Friendship.create(friend: drewni, user: homer)
friendship4 = Friendship.create(friend: homer, user: drewni)
