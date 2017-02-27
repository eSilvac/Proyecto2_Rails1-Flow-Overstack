class RemoveAnswerToUnvote < ActiveRecord::Migration[5.0]
  def change
    remove_reference :unvotes, :answer, foreign_key: true
  end
end
