module HomeHelper
  def percent_formatter(value)
    number_to_percentage(value * 100, format: "%n%", precision: 2)
  end
end
