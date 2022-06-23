puts "🌱 Seeding spices..."

# Seed your database here
10.times do
    name = Faker::Name.name
    Author.create(name: name, birth_year: rand(1895..2015), email: "#{name.gsub(/\s+/, "")}@books.com")
end

Author.all.each do |author|
2.times do
    Book.create(title: Faker::Book.title, rating: rand(1..10), release_date: Time.at((2015.to_f - 1905.to_f)*rand + 1905.to_f), author_id: author.id)
end
end

puts "✅ Done seeding!"
