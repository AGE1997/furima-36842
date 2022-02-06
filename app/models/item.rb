class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :days

  with_options presence: true do
    validates :image, :name, :explanation
    # 下記は15行目と内容が重複するため必要なし
    # validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
    # formatオプションは文字に対して行うものなので今回は数字に対して行うnumericalityオプションを用いる
    # , format: { with: /\A[0-9]+\z/ , message: "is invalid. Input half-width characters"}
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid. Price is out of setting range' }
  end

  validates :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :days_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
