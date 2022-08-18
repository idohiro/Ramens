class Ramen < ApplicationRecord

belongs_to :customers,optional: true
has_many :favorites, dependent: :destroy
has_many :ramen_comments, dependent: :destroy
validates :name, presence: true
validates :shop_name, presence: true
validates :introduction, presence: true
validates :price, presence: true

  has_one_attached :ramen_image

  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @ramen = Ramen.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @ramen = Ramen.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @ramen = Ramen.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @ramen = Ramen.where("name LIKE?","%#{word}%")
    else
      @ramen = Ramen.all
    end
  end


    def get_ramen_image(width, height)
      (ramen_image.attached?) ? ramen_image : 'sample.jpeg'
    end

end
