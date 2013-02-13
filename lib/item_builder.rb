class ItemBuilder
  def self.load_items
    item_file = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    parse_items(item_file)
  end

  def self.parse_items(item_file)
    item_totals = []
    item_file.each do |item|
      item  = {
                id: item[:id],
                name: item[:name],
                description: item[:description],
                unit_price: item[:unit_price],
                merchant_id: item[:merchant_id],
                created_at: item[:created_at],
                updated_at: item[:updated_at],
                   }
      item_totals << item
    end
    # Item.new(@item_totals)
    return item_totals
  end

end