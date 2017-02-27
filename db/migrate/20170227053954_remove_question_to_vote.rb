class RemoveQuestionToVote < ActiveRecord::Migration[5.0]
  def change
    remove_reference :votes, :question, foreign_key: true
  end
end
