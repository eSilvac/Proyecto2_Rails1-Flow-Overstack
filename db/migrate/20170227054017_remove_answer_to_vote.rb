class RemoveAnswerToVote < ActiveRecord::Migration[5.0]
  def change
    remove_reference :votes, :answer, foreign_key: true
  end
end
