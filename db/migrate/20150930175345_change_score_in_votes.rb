class ChangeScoreInVotes < ActiveRecord::Migration
  def change
    change_column(:votes, :score, :integer, default: 0)
  end
end
