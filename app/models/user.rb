class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  has_many :sessions, dependent: :destroy
  has_many :foods, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :username, uniqueness: true, presence: true, length: { minimum: 6 }, if: -> { new_record? || username_changed? }
  validates :email_address, uniqueness: true, presence: true, if: -> { new_record? || email_address_changed? }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || password.present? }

  after_create :create_user_default_avatar

  private

  def create_user_default_avatar
    unless avatar.attached?
      avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_avatar.png")),
                    filename: "default_avatar.png",
                    content_type: "image/png")
    end
  end
end
