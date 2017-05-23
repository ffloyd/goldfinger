module WithAmount
  extend ActiveSupport::Concern

  def amount
    # 1. зачем здесь второй аргумент в #new? Для Integer-конвертации он не нужен. Вообще можно так: BigDecimal(10)
    # 2. зачем @amount?
    @amount = rounded(BigDecimal.new(amount_cents, 4) / 100)
  end
end
