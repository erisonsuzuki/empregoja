class Job < ApplicationRecord
  belongs_to :company
	belongs_to :category

	validates :title, :category, :description, :location, :company_id, presence: true

  def expired?
    90.days.ago > created_at
  end

  def recent?
    5.days.ago < created_at
  end
end
