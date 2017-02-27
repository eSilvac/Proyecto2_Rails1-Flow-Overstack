class RemoveQuestionToUnvote < ActiveRecord::Migration[5.0]
  def change
    remove_reference :unvotes, :question, foreign_key: true
  end
end
