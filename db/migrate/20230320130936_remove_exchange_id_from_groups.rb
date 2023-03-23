class RemoveExchangeIdFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :exchange_id, :bigint
  end
end
