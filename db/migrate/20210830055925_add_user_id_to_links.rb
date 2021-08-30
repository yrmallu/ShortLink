class AddUserIdToLinks < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :user
    add_column :links, :count, :integer, default: 0
  end
end
