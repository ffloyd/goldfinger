class Payment < ApplicationRecord
  include Roundable

  belongs_to :loan

  def amount
    rounded(amount_cents.to_f / 100)
  end
end
