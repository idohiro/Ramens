class Ramen < ApplicationRecord

belongs_to :customers,optional: true
has_many :favorites, dependent: :destroy
has_many :ramen_comments, dependent: :destroy
  has_one_attached :ramen_image

  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @ramen = Ramen.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @ramen = Ramen.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @ramen = Ramen.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @ramen = Ramen.where("title LIKE?","%#{word}%")
    else
      @ramen = Ramen.all
    end
  end


    def get_ramen_image(width, height)
        unless ramen_image.attached?
            file_path = Rails.root.join('app/assets/images/sample.jpg')
        end
    end

end
