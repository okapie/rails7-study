class Toy < ApplicationRecord
  belongs_to :buyable, polymorphic: true, optional: true
end
