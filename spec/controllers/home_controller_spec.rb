describe HomeController do
  subject { response }

  describe '#index' do
    before { get :index }
    it { should be_success }
  end

  describe '#registration_tips' do
    before { get :registration_tips, locale: I18n.locale }
    it { should be_success }
  end
end
