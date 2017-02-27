class RemoveAnswerToComment < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :answer, foreign_key: true
  end
end
