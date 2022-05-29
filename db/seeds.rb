Article.destroy_all

admin = User.first

Category.all.each do |category|
  30.times do
    Article.create!(
      title: "Article #{rand(10_000)}",
      body: Faker::Lorem.sentence(word_count: 50, supplemental: false, random_words_to_add: 4),
      category_id: category.id,
      user_id: rand(1..2),
      created_at: rand(365).days.ago
    )
  end
end

# 50.times do |index|
#   Spice.create!(name: Faker::Food.spice,
#                         description: Faker::Lorem.sentence(20, false, 0).chop,
#                         image_url: "site.com/here_is_a_picture_of_cardamom.jpg")
# end

# p "Created #{Spice.count} spices"

p "Created #{Article.count} articless"
