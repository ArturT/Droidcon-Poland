describe API::V1::SchedulesController do
  subject { response }

  context do
    # reload records to get proper start_time and end_time format
    let!(:schedule1) { create(:schedule).reload }
    let!(:schedule2) { create(:schedule).reload }

    describe '#index' do
      before { get :index, locale: :en }

      it { should be_success }
      it { expect(subject.body).to have_json_size(2) }
      it { expect(subject.body).to include_json(schedule1.to_json) }
      it { expect(subject.body).to include_json(schedule2.to_json) }
    end

    describe '#extra' do
      before { get :extra, locale: :en }

      it { should be_success }
      it { expect(subject.body).to have_json_size(2) }
    end
  end
end
