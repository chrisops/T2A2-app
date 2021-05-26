class Offer < ApplicationRecord

  validate :buyer_must_not_be_owner
  #  :seller_must_own_card, 

  belongs_to :buyer, :class_name => 'User'
  belongs_to :seller, :class_name => 'User'
  belongs_to :card

  def buyer_must_not_be_owner
    # card buyer is not the owner
    if self.buyer.id == self.card.user.id
      errors.add(:buyer, "can't buy their own item.")
    end
    puts "buyer: #{self.buyer.id} owner: #{self.card.user.id}"
  end

  def seller_must_own_card
    # seller is the owner
    if self.seller.id != self.card.user.id
      errors.add(:seller, "must own the item.")
    end
    puts "seller: #{self.seller.id} owner: #{self.card.user.id}"
  end
end
