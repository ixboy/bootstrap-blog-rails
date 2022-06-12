puts 'deleting all data...'

User.destroy_all
Article.destroy_all
Category.destroy_all

puts 'creating users...'

1.upto(10) do |n|
  user = User.new(
    id: n,
    email: "user#{n}@email.com",
    password: '123456',
    password_confirmation: '123456'
  )
  user.skip_confirmation!
  user.save!
end
admin1 = User.first
admin2 = User.last
admin1.toggle!(:admin)
admin2.toggle!(:admin)

puts 'creating categories...'

Category.create!(id: 1,  name: 'Ruby')
Category.create!(id: 2,  name: 'Python')
Category.create!(id: 3,  name: 'JavaScript')
Category.create!(id: 4,  name: 'Go')
Category.create!(id: 5,  name: 'C')
Category.create!(id: 6,  name: 'Swift')
Category.create!(id: 7,  name: 'Php')
Category.create!(id: 8,  name: 'C++')
Category.create!(id: 9,  name: 'Kotlin')
Category.create!(id: 10, name: 'Perl')
Category.create!(id: 11, name: 'Rust')
Category.create!(id: 12, name: 'Scala')

puts 'creating articles...'

Category.all.each do |category|
  30.times do
    Article.create!(
      title: "Article #{rand(10_000)}",
      body: Faker::Lorem.sentence(word_count: 50, supplemental: false, random_words_to_add: 4),
      category_id: category.id,
      user_id: rand(1..10),
      created_at: rand(365).days.ago
    )
  end
end
p "Created #{Article.count} articless"
p "The first admin is: #{admin1.email}"
p "The second admin is: #{admin2.email}"
p 'Finished seeding...'
