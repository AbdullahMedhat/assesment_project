class Admin < ActiveRecord::Base
  has_many :programs
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  include DeviseInvitable::Inviter
end
