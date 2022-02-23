class Maker < ApplicationRecord
  has_many :toys, as: :buyable
end
