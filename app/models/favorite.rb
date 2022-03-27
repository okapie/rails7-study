class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :toy, optional: true

  composed_of :toy_maker, mapping: [%w(toy_maker_name toy_maker_name), %w(store_name store_name)]
  composed_of :store_toy_maker,
    class_name: 'ToyMaker',
    mapping: [%w(store_maker_name toy_maker_name), %w(store_name store_name)]

  scope :by_earliest_created, -> { order(created_at: :asc) }
  scope :by_toy_maker_name_not_unset, -> (toy_maker_name) { where.not(toy_maker_name: "未設定") }
  scope :by_store_maker_name_not_unset, -> (store_maker_name) { where.not(store_maker_name: "未設定") }
end
