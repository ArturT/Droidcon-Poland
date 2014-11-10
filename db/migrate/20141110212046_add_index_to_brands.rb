class AddIndexToBrands < ActiveRecord::Migration
  def change
    add_index :brands, :category
  end
end
