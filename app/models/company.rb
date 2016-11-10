class Company < ApplicationRecord
	has_many :jobs

  validates :name, :mail, presence: true
end
