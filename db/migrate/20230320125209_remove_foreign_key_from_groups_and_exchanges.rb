class RemoveForeignKeyFromGroupsAndExchanges < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :groups, :exchanges
    remove_foreign_key :exchanges, column: :group_id
  end
end