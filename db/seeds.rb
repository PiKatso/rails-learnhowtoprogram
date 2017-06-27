Lesson.destroy_all
Section.destroy_all
Chapter.destroy_all

2.times do |index|
  Chapter.create!(name: Faker::StarTrek.specie)
end


10.times do |index|
  Section.create!(name: Faker::LordOfTheRings.location,
                  chapter_id: 1)
end

40.times do |index|
  Lesson.create!(name: Faker::StarWars.planet,
                  content: Faker::StarWars.quote,
                  number: 1,
                  section_id: 1)
  end

p "Created #{Lesson.count} lessons"

# once initially set up/to edit must run 'rake db:setup'
# also 'rake db:test:prepare'
