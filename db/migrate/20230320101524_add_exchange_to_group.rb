class AddExchangeToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :exchange, null: false, foreign_key: true
  end
end
