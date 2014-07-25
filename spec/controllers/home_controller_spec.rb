describe HomeController do
  subject { response }

  describe '#index' do
    before { get :index }
    it { should be_success }
  end
end
