class Store < ApplicationRecord
  has_many :toys, as: :buyable
end
