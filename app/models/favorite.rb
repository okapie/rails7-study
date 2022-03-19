class ToyMaker
  attr_accessor :toy_maker, :store_name
  def initialize(toy_maker, store_name)
    @toy_maker, @store_name = toy_maker, store_name
  end
end

class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :toy, optional: true

  composed_of :toy_maker, mapping: [%w(toy_maker_name toy_maker_name), %w(store_name store_name)]
  composed_of :store_toy_maker,
    class_name: 'ToyMaker',
    mapping: [%w(store_maker_name toy_maker_name), %w(store_name store_name)]
end
