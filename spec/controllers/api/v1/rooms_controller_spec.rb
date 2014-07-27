describe API::V1::RoomsController do
  subject { response }

  describe '#index' do
    let!(:room1) { create(:room) }
    let!(:room2) { create(:room) }

    before { get :index, locale: :en }

    it { should be_success }
    it { expect(subject.body).to have_json_size(2) }
    it { expect(subject.body).to include_json(room1.to_json) }
    it { expect(subject.body).to include_json(room2.to_json) }
  end
end
