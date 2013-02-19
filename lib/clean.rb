module Clean
  def unit_price(unit_price)
    BigDecimal.new(unit_price) / 100
  end
end