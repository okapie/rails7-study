class User < ApplicationRecord
  has_secure_password

  has_many :members, dependent: :destroy
  has_many :groups, through: :members
end
