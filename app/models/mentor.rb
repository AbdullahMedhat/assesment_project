class Mentor < ApplicationRecord
  # Include default devise modules.
  belongs_to :program
  has_many :projects

  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  has_many :submissions
end
