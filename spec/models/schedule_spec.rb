describe Schedule do
  let(:schedule) { FactoryGirl.build(:schedule) }

  it { expect(schedule).to be_valid }

  it { should belong_to(:speaker) }
  it { should belong_to(:room) }
  it { should validate_presence_of(:room) }
end
