puts 'deleting all data...'

User.destroy_all
Article.destroy_all
Category.destroy_all

puts 'creating users...'

1.upto(10) do |n|
  user = User.new(
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

Category.create!(name: 'Ruby')
Category.create!(name: 'Python')
Category.create!(name: 'JavaScript')
Category.create!(name: 'Go')
Category.create!(name: 'C')
Category.create!(name: 'Swift')
Category.create!(name: 'Php')
Category.create!(name: 'C++')
Category.create!(name: 'Kotlin')
Category.create!(name: 'Perl')
Category.create!(name: 'Rust')
Category.create!(name: 'Scala')

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
