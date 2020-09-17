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

50.times do |n|

  Customer.create!(
                   email: "test#{n + 1}@test.com",
                   last_name: "文月#{n}",
                   last_name_kana: "フミヅキ#{n}",
                   first_name: "太郎#{n}",
                   first_name_kana: "タロウ#{n}",
                   postal_code: "1111111",
                   address: "横岡県氷川市絵向寺#{n}丁目",
                   telephone_number: "11111111111",
                   is_deleted: false,
                   password: "111111",
                   password_confirmation: "111111",
                   )
  Address.create!(
                  customer_id: 1,
                  name: "文月なな#{n}",
                  postal_code: '1111111',
                  address: '三橋県東里見町松林2-15-#{n}'
                   )
   Genre.create!(
                name: "ジャンルその#{n}",
                is_active: true
                )
   Item.create!(
                  name: "自家製パン#{n}",
                  introduction: "#{n}倍美味しくなりました！（当社比）",
                  genre_id: 1,
                  price: 260,
                  is_active: true,
                  image: open("./app/assets/images/anpan.jpg")
                   )

end

