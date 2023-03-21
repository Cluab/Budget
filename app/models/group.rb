class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exchanges

  def total_amount
    self.exchanges.sum(:amount)
  end

  def recent_exchanges
    exchanges.order(created_at: :desc)
  end
end
