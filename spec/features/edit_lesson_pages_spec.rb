require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'visit lesson details from lessons' do
  it 'navigates to the lessons details path from the section lessons' do
    vulcan = Chapter.create(:name => 'Vulcan7')
    vaiya = vulcan.sections.create(:name => "Vaiya6")
    booyah = vaiya.lessons.create(:name => 'booyah2', :content => 'quote', :number => 3)
    visit chapter_path(vulcan)
    click_link 'Vaiya6'
    click_link 'booyah2'
    click_link 'Edit Lesson'
    fill_in 'Name', :with => 'Western Box Turtle'
    click_on 'Update Lesson'

    expect(page).to have_content 'Course:'
  end
end

DatabaseCleaner.clean
