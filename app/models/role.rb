class Role < ApplicationRecord
  validates :name, uniqueness: true

  has_many :permissions
  has_many :users, through: :permissions
end
