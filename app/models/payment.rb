class Payment < ApplicationRecord
  include Roundable

  belongs_to :loan, counter_cache: true

  validates :amount_cents,
            presence: true,
            numericality: { only_integer: true }

  def amount
    rounded(amount_cents.to_f / 100)
  end
end
