require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'visit section from chapter' do
  it 'navigates to the lessons path from the section' do
    vulcan = Chapter.create(:name => 'Vulcan2')
      vaiya = vulcan.sections.create(:name => "Vaiya")
    visit chapter_path(vulcan)
    
    click_link 'Vaiya'
    expect(page).to have_content 'Weekly Section'
  end
end

DatabaseCleaner.clean
