class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :status, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :subtotal, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def self.ransackable_attributes(auth_object = nil)
    ["status", "total_price", "created_at", "customer_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "order_items"]
  end
end