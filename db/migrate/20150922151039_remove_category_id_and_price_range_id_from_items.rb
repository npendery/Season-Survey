class RemoveCategoryIdAndPriceRangeIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :category_id
    remove_column :items, :price_range_id
  end
end
