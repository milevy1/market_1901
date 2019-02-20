class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendors.map { |vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors.select { |vendor| vendor.check_stock(item) > 0 }
  end

  def sorted_item_list
    vendors.map { |vendor| vendor.inventory.keys }
      .flatten
      .uniq
      .sort
  end

  def total_inventory
    vendors.inject(Hash.new(0)) do |total_inventory_hash, vendor|
      vendor.inventory.each do |item, item_amount|
        total_inventory_hash[item] += item_amount
      end
      total_inventory_hash
    end
  end

end
