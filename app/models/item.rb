class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_charges, :prefecture, :days

  with_options presence: true do
    validates :image, :name, :explanation
    validates :price, inclusion: { in: 300..9_999_999 , message: "is out of setting range"}
    # , format: { with: /\A[0-9]+\z/ , message: "is invalid. Input half-width characters"}
    validates :price, numericality: { with: /\A[0-9]+\z/ , message: "is invalid. Input half-width characters"}
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is invalid"}
  end

  validates :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :days_id, numericality: { other_than: 1 , message: "can't be blank"}
end