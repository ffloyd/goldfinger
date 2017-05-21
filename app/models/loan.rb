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

  def overall_debt
    rounded(monthly_debt_total * months)
  end

  def paid_percents
    rounded(amount * rate / 12 * payments.size)
  end

  def paid_loan
    rounded(monthly_loan_debt * months)
  end

  def yearly_yield
    rounded(paid_percents / paid_loan * 12 / months)
  end
end
