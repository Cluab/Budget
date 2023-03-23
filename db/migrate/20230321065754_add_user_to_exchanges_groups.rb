class AddUserToExchangesGroups < ActiveRecord::Migration[6.1]
  def change
    add_reference :exchanges_groups, :user , null: false, foreign_key: true
  end
end
