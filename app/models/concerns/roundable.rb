module Roundable
  extend ActiveSupport::Concern

  private
  def rounded(some_amount)
    some_amount.to_f.round(2)
  end
end