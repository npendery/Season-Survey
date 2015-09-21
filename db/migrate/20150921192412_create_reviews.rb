class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :description, null: false
      t.belongs_to :user, null: false
      t.belongs_to :item, null: false
    end
  end
end
