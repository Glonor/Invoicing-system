class Client < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :invoices, dependent: :destroy
  belongs_to :user
  before_save { email.downcase! }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  validates :tariff, presence: true
  validates :user_id, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end

  def to_s
    fullname
  end
end
