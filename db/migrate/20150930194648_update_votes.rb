class UpdateVotes < ActiveRecord::Migration
  def change
    rename_column(:votes, :score, :vote)
  end
end
