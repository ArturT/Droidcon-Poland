describe Brand do
  let(:brand) { build(:brand) }

  it { expect(brand).to be_valid }

  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should_not validate_presence_of(:image) }
end
