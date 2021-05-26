class Card < ApplicationRecord
    belongs_to :user
    has_many :offers, dependent: :destroy
    has_one_attached :card_image
    validates :name, :condition, :price, :qty, :card_image, presence: true

    def self.search(search,user_id=nil)
        if search
            if user_id
                match = Card.where("name ILIKE ? AND user_id = ?", "%#{search}%",user_id)
            else
                match = Card.where("name ILIKE ?", "%#{search}%")
            end
            if match
                match
            else
                flash.now[:errors] = "No matching results for #{search}"
                Card.order('id DESC')
            end
        else
            Card.order('id DESC')
        end
    end
end
