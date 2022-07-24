class Ramen < ApplicationRecord

belongs_to :customers
has_many :favorites, dependent: :destroy
  has_one_attached :ramen_image

  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end
end
