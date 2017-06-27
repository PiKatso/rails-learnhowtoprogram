require 'rails_helper'

describe 'visit section from chapter' do
  it 'navigates to section route' do
    vulcan = Chapter.create(:name => 'Vulcan')
    visit chapter_path(vulcan)
    click_link 'Vulcan'
    expect(page).to have_content 'Weekly Sections Available'
  end
end
