class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exchanges

  def total_amount
    self.exchanges.sum(:amount)
  end
end
