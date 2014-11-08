class AddSocialLinksToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :facebook_url, :string
    add_column :speakers, :twitter_url, :string
    add_column :speakers, :google_plus_url, :string
  end
end
