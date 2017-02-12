class RemoveTwitterurlFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :twitterurl, :string
  end
end
