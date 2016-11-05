class Job < ApplicationRecord
	belongs_to :company

	validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :company_id, presence: true
end
