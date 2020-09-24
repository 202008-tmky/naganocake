# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
	email: 'test@test.com',
	password: 'testtest'
	)

Customer.create!(
                   email: "test1@test.com",
                   first_name: "長州",
                   first_name_kana: "チョウシュウ",
                   last_name: "力",
                   last_name_kana: "リキ",
                   postal_code: "1111111",
                   address: "横岡県氷川市絵向寺2丁目",
                   telephone_number: "11111111111",
                   is_deleted: false,
                   password: "111111",
                   password_confirmation: "111111",
                   )

Genre.create!(
  [
    {
      id: 1,
      name: 'チョコレート',
      is_active: true
    },

    {
      id: 2,
      name: 'ケーキ',
      is_active: true
    },

    {
      id: 3,
      name: 'クッキー',
      is_active: true
    },
  ]
  )
   Item.create!(
   	[
   				{
                  name:"生チョコレート",
                  introduction: "自家製のチョコレートに生クリームを混ぜ合わせ作りました",
                  genre_id: 1,
                  price: 360,
                  is_active: true,
                  image: open("./app/assets/images/choco2.jpg")
                 },

                {
                  name:"シフォンケーキ",
                  introduction: "国産の卵使用し、ふっくら仕上げました",
                  genre_id: 2,
                  price: 650,
                  is_active: true,
                  image: open("./app/assets/images/cake.jpg")
                 },

                 {
                  name:"ぴえんクッキー",
                  introduction: "カリカリに仕上げました",
                  genre_id: 3,
                  price: 250,
                  is_active: true,
                  image: open("./app/assets/images/cokkie.jpg")
                  },
	]
  	)