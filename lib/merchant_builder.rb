class MerchantBuilder
  def self.load_merchants
    merchant_file = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    parse_merchants(merchant_file)
  end

  def self.parse_merchants(merchant_file)
    merchant_totals = []
    merchant_file.each do |merchant|
      merchant  = {
                id: merchant[:id],
                name: merchant[:name],
                created_at: merchant[:created_at],
                updated_at: merchant[:updated_at],
                   }
      merchant_totals << merchant
    end
  # Merchant.new(@merchant_totals)
  return merchant_totals
  end

end