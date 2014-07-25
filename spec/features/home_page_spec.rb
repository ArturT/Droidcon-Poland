describe 'Home Page' do
  before do
    visit root_path
  end

  it do
    within '.top-bar' do
      expect(page).to have_content 'Droidcon Kraków'
    end
  end
end
