class Student < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable,:omniauthable, :invitable

  include DeviseTokenAuth::Concerns::User
end
