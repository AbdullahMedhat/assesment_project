class Student < ApplicationRecord
  # Include default devise modules.
  belongs_to :program
  has_many :projects



  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable

  include DeviseTokenAuth::Concerns::User
end
