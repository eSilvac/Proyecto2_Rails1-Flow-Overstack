class RemoveQuestionToComment < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :question, foreign_key: true
  end
end
