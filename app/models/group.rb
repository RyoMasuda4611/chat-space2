class Group < ApplicationRecord
  validates :name, presence: true
  has_many :messages, dependent: :destroy
  has_many :user_groups
  has_many :users, through: :user_groups
  accepts_nested_attributes_for :user_groups
end
