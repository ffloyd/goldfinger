class Company < ApplicationRecord
  has_many :loans

  validates :name,
            length: { minimum: 2 },
            presence: true,
            uniqueness: true
end
