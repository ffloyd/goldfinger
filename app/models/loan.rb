class Loan < ApplicationRecord
  include Roundable

  belongs_to :company
  has_many :payments

  def amount
    amount_cents.to_f / 100
  end

  def monthly_loan_debt
    rounded(amount / months)
  end

  def monthly_percents_debt
    rounded(amount * rate / 12)
  end

  def monthly_debt_total
    rounded(monthly_loan_debt + monthly_percents_debt)
  end

  def monthly_payment
    rounded(monthly_debt_total * months)
  end
end
