class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_charges, :prefecture, :days

  validates :image, :name, :explanation, :price, presence: true

  validates :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :days_id, numericality: { other_than: 1 , message: "can't be blank"}
end