class MerchantBuilder

  def self.from_csv(filename="./data/merchants.csv")
    parse CSV.open(filename, headers: true)
  end

  def self.parse(merchant_file)
    merchants = merchant_file.collect do |merchant|
      Merchant.new(merchant)
    end
    Merchant.store(merchants)
  end

end