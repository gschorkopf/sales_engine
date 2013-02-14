class ItemBuilder

  def self.load_customers(filename="./data/items.csv")
    item_file = CSV.open(filename, headers: true)
    parse_items(item_file)
  end

  def self.parse_items(item_file)
    item_totals = []
    item_file.collect do |item|
      item_totals << Item.new(item)
    end
    Item.store_array(item_totals)
    return item_totals
  end

end