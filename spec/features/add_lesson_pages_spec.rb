require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'visit section from chapter' do
  it 'navigates to the lessons path from the section' do
    vulcan = Chapter.create(:name => 'Vulcan2')
      vaiya = vulcan.sections.create(:name => "Vaiya")
    visit chapter_path(vulcan)

    click_link 'Vaiya'
    click_link 'Add Lesson'
    fill_in 'Name', :with => 'Anakin'
    fill_in 'Content', :with => 'Sundance'
    fill_in 'Number', :with => '42'
    select('Vaiya', :from => 'Section')
    click_on 'Create Lesson'

    expect(page).to have_content 'Course:'
  end
end

DatabaseCleaner.clean
