class AddUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :url, :string
  end
end
