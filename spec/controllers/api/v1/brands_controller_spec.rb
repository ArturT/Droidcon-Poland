describe API::V1::BrandsController do
  subject { response }

  describe '#index' do
    let!(:brand1) { create(:brand) }
    let!(:brand2) { create(:brand) }

    before { get :index, locale: :en }

    it { should be_success }
    it { expect(subject.body).to have_json_size(2) }
    it { expect(subject.body).to include_json(brand1.to_json) }
    it { expect(subject.body).to include_json(brand2.to_json) }
  end
end
