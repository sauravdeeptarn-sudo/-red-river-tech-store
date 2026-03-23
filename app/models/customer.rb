class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, optional: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end