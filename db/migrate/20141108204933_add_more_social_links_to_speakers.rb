class AddMoreSocialLinksToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :linkedin_url, :string
    add_column :speakers, :github_url, :string
  end
end
