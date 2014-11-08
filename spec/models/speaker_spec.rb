describe Speaker do
  let(:speaker) { build(:speaker) }

  it { expect(speaker).to be_valid }

  it { should have_many(:schedules) }
  it { should validate_presence_of(:name) }
  it { should_not validate_presence_of(:photo) }
  it { should_not validate_presence_of(:facebook_url) }
  it { should_not validate_presence_of(:twitter_url) }
  it { should_not validate_presence_of(:google_plus_url) }
  it { should_not validate_presence_of(:linkedin_url) }
  it { should_not validate_presence_of(:github_url) }
end
