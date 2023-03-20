class CreateExchangeGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_groups do |t|
      t.belongs_to :exchange
      t.belongs_to :group
      t.timestamps
    end
  end
end