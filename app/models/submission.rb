class Submission < ApplicationRecord
  belongs_to :mentor
  belongs_to :student
  belongs_to :project
  validates :grade, inclusion: { in: [nil ,*(0..10)] }

  def status
    if mentor_id && grade
      'marked'
    elsif mentor_id
      'claimed'
    else
      'pending'
    end
  end
end
