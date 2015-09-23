class ChangeReviewRating < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE reviews ALTER COLUMN rating TYPE integer USING (rating::integer)'
  end

  def down
    execute 'ALTER TABLE reviews ALTER COLUMN rating TYPE text USING (rating::text)'
  end
end
