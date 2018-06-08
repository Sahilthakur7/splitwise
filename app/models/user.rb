class User < ApplicationRecord
    require 'open-uri'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_attached_file :avatar, styles: {medium: "300x300",thumb: "150x150"}
  validates_attachment_content_type :avatar,content_type: /\Aimage\/.*\Z/

  has_many :group_relationships
  has_many :groups, through: :group_relationships
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.name = auth.info.first_name + ' ' + auth.info.last_name
          url = auth.info.image.gsub("http","https") + "?type=large"
          user.avatar = URI.parse(url) if auth.info.image?
          user.provider = auth.provider
          user.username = auth.info.first_name + "#{(rand() * 100).to_i}" + auth.info.last_name
          user.uid = auth.uid
          user.password = Devise.friendly_token[0,20]
      end
  end

  def apply_omniauth(auth)
      update_attributes(
          provider: auth.provider,
          uid: auth.uid
      )
  end

  def has_facebook_linked?
      self.provider.present? && self.uid.present?
  end
end
