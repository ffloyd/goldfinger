class Loan < ApplicationRecord
  belongs_to :company
  has_many :payments
end
