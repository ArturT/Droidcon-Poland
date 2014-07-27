describe API::V1::SpeakersController do
  subject { response }

  describe '#index' do
    let!(:speaker1) { create(:speaker) }
    let!(:speaker2) { create(:speaker) }

    before { get :index, locale: :en }

    it { should be_success }
    it { expect(subject.body).to have_json_size(2) }
    it { expect(subject.body).to include_json(speaker1.to_json) }
    it { expect(subject.body).to include_json(speaker2.to_json) }
  end
end
