module SalesEngine
  module Clean
    def self.price(unit_price)
      BigDecimal.new(unit_price) / 100
    end

    def self.date(created_at)
      Date.parse(created_at)
    end
  end
end