class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.belongs_to :category, null: false
      t.string :description, null: false
      t.string :purchase_url
      t.belongs_to :price_range, null: false
    end
    add_index :items, :name, unique: true
  end
end
