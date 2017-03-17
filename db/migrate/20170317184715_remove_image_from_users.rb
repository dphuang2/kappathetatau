class RemoveImageFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :users, :image
  end
end
