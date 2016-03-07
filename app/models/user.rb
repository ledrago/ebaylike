class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  attr_accessor :remember_token
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, case_sensitive: false}
  validates :firstname, length: {in: 2..15}
  validates :lastname, length: {in: 2..15}
  validates :password, confirmation: true, length: {in: 2..25 }, :on => :create
  validates :password, confirmation:false, :on => :update
  validates :password_confirmation, presence: true, :on => :create
  validates :password_confirmation, confirmation: false, :on  => :update

  ratyrate_rater
  ratyrate_rateable 'trustability'
  is_impressionable

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
