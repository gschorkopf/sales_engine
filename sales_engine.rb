require 'csv'

class SalesEngine
  def initialize
    @merchant_totals = []
  end

  def startup
    load_merchants
    "Load complete!"
  end

  def load_merchants
    merchant_file = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    parse_merchants(merchant_file)
  end

  def parse_merchants(merchant_file)
    merchant_file.each do |merchant|
      merchant  = {
                id: merchant[:id],
                name: merchant[:name],
                created_at: merchant[:created_at],
                updated_at: merchant[:updated_at],
                   }
      @merchant_totals << merchant
    end
  end

end