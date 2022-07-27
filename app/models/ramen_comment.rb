class RamenComment < ApplicationRecord
   belongs_to :customer
   belongs_to :ramen
   validates :body, presence: true
end
