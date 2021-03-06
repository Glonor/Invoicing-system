class User < ApplicationRecord
  has_many :clients, dependent: :destroy
  has_many :invoices, dependent: :destroy

  before_save { email.downcase! }
  before_save { fiscal_code.upcase! }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :fiscal_code, presence: true, length: { is: 16 }
  validates :address, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :postal_code, presence: true
  validates :phone, presence: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def fullname
    "#{first_name} #{last_name}"
  end

  def to_s
    fullname
  end
end
