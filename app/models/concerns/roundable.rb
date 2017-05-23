module Roundable
  extend ActiveSupport::Concern

  private
  def rounded(some_amount)
    BigDecimal.new(some_amount, 4).round(2)
  end
end
