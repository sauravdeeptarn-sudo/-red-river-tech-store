class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  scope :on_sale, -> { where(is_on_sale: true) }
  scope :new_arrivals, -> { where("created_at >= ?", 3.days.ago) }
  scope :recently_updated, -> { where("updated_at >= ? AND created_at < ?", 3.days.ago, 3.days.ago) }

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "price", "stock_quantity", "category_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end