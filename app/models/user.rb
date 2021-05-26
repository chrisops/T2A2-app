class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :password_complexity
  after_initialize :auto_name

  has_many :cards, dependent: :destroy
  has_many :buyer_offers, :class_name => 'Offer', :foreign_key => 'buyer_id'
  has_many :seller_offers, :class_name => 'Offer', :foreign_key => 'seller_id'

  def auto_name
    if self.name == ""
      self.name = self.email.match(/.*(?=@)/)
    end
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase and 1 digit'
  end
end
