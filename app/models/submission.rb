class Submission < ApplicationRecord
  belongs_to :mentor
  belongs_to :student

  validates :grade, inclusion: { in: 0..10 }

  def status 
    if mentor_id && grade
      'pending'
    elsif grade
      'claimed'
    else
      'makred'
    end
  end
end
