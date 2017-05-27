class Mentor < ApplicationRecord
  # Include default devise modules.
  belongs_to :program
  has_one :group
  
  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable

end
