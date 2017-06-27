require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'visit section from chapter' do
  it 'navigates to section route' do
    vulcan = Chapter.create(:name => 'Vulcan3')
    visit chapters_path
    click_link 'Vulcan3'
    expect(page).to have_content 'Weekly Sections Available'
  end
end
DatabaseCleaner.clean
