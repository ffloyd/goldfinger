module WithAmount
  extend ActiveSupport::Concern

  def amount
    @amount = rounded(BigDecimal.new(amount_cents, 4) / 100)
  end
end
