module SalesEngine
  class ItemBuilder

    def self.from_csv(filename="./data/items.csv")
      parse CSV.open(filename, headers: true)
    end

    def self.parse(item_file)
      items = item_file.collect do |item|
        Item.new(item)
      end
      Item.store(items)
    end

  end
end