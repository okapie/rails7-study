class Toy < ApplicationRecord
  belongs_to :buyable, polymorphic: true, optional: true
  has_many :favorites
end
