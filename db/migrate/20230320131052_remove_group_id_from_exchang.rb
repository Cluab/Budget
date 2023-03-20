class RemoveGroupIdFromExchang < ActiveRecord::Migration[6.1]
  def change
    remove_column :exchanges, :group_id, :bigint
  end
end
