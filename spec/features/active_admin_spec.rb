describe 'Active Admin' do
  let(:user) { create(:admin_user) }

  before do
    visit new_admin_user_session_path
    fill_in 'admin_user_email', with: user.email
    fill_in 'admin_user_password', with: user.password
    find(:xpath, '//input[@name="commit"]').click
  end

  it do
    expect(page).to have_content 'Signed in successfully'
  end
end
