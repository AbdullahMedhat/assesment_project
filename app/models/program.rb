class Program < ApplicationRecord
  before_action :authenticate_admin!

  belongs_to :admin


end
