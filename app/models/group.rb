class Group < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members, dependent: :destroy
end
