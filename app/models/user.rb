# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  info                   :string
#  github                 :string
#  about                  :text
#  twitterurl             :string
#  name                   :string
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	attr_accessor :login

	has_many :questions, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :unvotes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :answers, dependent: :destroy

  has_attached_file :image

	validates :info, presence: true
  validates :name, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  
	validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
	
  	def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        elsif conditions.has_key?(:username) || conditions.has_key?(:email)
          where(conditions.to_h).first
        end
    end

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
