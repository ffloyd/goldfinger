class Loan < ApplicationRecord
  include Roundable

  belongs_to :company
  has_many :payments

  def self.realistic_yearly_yield
    sum(&:yearly_yield) / count
  rescue
    OPTIMISTIC_YIELD
  end

  def amount
    @amount = amount_cents.to_f / 100
  end

  def monthly_loan_debt
    rounded(amount / months)
  end

  def monthly_percents_debt(extra = false)
    chosen_rate = extra ? extra_rate : rate

    rounded(amount * chosen_rate / 12)
  end

  def monthly_debt_total(extra = false)
    rounded(monthly_loan_debt + monthly_percents_debt(extra))
  end

  def monthly_extra_total
    monthly_debt_total(extra = true)
  end

  def overall_debt
    # TODO: How to include extra payments?
    rounded(monthly_debt_total * months)
  end

  def paid_percents
    # TODO: Refactor It
    normal_percents = amount * rate / 12 * payments.where(extra: false).size
    extra_percents  = amount * extra_rate / 12 * payments.where(extra: true).size

    rounded(normal_percents + extra_percents)
  end

  def paid_loan
    rounded(monthly_loan_debt * months)
  end

  def yearly_yield
    rounded(paid_percents / paid_loan * 12 / months)
  end
end
