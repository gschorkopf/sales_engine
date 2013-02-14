class MerchantBuilder

  def self.load_merchants(filename="./data/merchants.csv")
    merchant_file = CSV.open(filename, headers: true)
    parse_merchants(merchant_file)
  end

  def self.parse_merchants(merchant_file)
    merchant_totals = []
    merchant_file.collect do |merchant|
      merchant_totals << Merchant.new(merchant)
    end
    Merchant.store_array(merchant_totals)
    return merchant_totals
  end

end