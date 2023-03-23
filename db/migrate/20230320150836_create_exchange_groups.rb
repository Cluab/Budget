class CreateExchangeGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :exchanges_groups do |t|
      t.belongs_to :exchange, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
