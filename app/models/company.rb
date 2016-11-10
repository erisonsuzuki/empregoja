class Company < ApplicationRecord
	has_many :jobs

  validates :name, :mail, presence: true

  def premium?
    jobs.size >= 5
  end
end
