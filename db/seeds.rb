Chapter.destroy_all

4.times do |index|
  chapter = Chapter.create!(name: Faker::StarTrek.specie)

  4.times do |index|
     section = chapter.sections.create!(name: Faker::LordOfTheRings.location)

     8.times do |index|
       section.lessons.create!(name: Faker::StarWars.planet,
                             content: Faker::StarWars.quote,
                             number: Faker::Number.digit)
     end
  end
end

#how to create relationships with seed data


p "Created #{Chapter.count} chapters"

# once initially set up/to edit must run 'rake db:setup'
# also 'rake db:test:prepare'
