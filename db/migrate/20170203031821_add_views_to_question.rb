class AddViewsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :views, :integer
  end
end
