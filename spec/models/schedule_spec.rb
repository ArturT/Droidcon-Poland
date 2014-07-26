describe Schedule do
  let(:schedule) { FactoryGirl.build(:schedule) }

  it { expect(schedule).to be_valid }

  it { should belong_to(:speaker) }
  it { should belong_to(:room) }
  it { should validate_presence_of(:room) }

  it_behaves_like 'schedule time validator'

  describe '.last_updated' do
    let(:s1) { FactoryGirl.create(:schedule) }
    let(:s2) { FactoryGirl.create(:schedule) }
    let(:s3) { FactoryGirl.create(:schedule) }

    subject { described_class.last_updated.to_s }

    before do
      Timecop.freeze(Date.today - 1) { s1 }
      Timecop.freeze(Date.today - 2) { s2 }
      Timecop.freeze(Date.today - 3) { s3 }
      s2.touch
    end

    it { should_not eql s1.updated_at.to_s }
    it { should eql s2.updated_at.to_s }
    it { should_not eql s3.updated_at.to_s }
  end
end
