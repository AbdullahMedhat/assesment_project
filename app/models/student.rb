class Student < ApplicationRecord
  # Include default devise modules.
  belongs_to :program
  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable

  include DeviseTokenAuth::Concerns::User
end
