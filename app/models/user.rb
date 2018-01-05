class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessor :remember_token
  validates :email, presence: true, length: {maximum: Settings.email_max_lengh},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.password_min_lengh}, allow_nil: true
  validates :name, presence: true, length: {maximum: Settings.name_max_lengh}
  validates :address, length: {maximum: Settings.address_max_lengh}
  validates :school, length: {maximum: Settings.school_max_lengh}
  before_save :downcase_email
  has_secure_password
  scope :desc_created_at, ->{order(created_at: :desc)}
  # log in - log out
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
