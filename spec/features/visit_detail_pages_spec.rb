require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'visit lesson details from lessons' do
  it 'navigates to the lessons details path from the section lessons' do
    vulcan = Chapter.create(:name => 'Vulcan7')
    vaiya = vulcan.sections.create(:name => "Vaiya5")
    booyah = vaiya.lessons.create(:name => 'booyah', :content => 'quote', :number => 3)
    visit chapter_path(vulcan)
    click_link 'Vaiya5'
    click_link 'booyah'
    expect(page).to have_content 'Lesson:'
  end
end

DatabaseCleaner.clean
