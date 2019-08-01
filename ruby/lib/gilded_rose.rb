class GildedRose

  QUALITY_MAX = 50
  QUALITY_MIN = 0

  def initialize(items)
    @items = items
    @Age_quality_increase = ["Backstage passes to a TAFKAL80ETC concert", "Aged Brie"]
    @Age_quality_does_not_change = ["Sulfuras, Hand of Ragnaros"]
  end

  def update_quality()
    @items.each do |item|
      next if @Age_quality_does_not_change.include?(item.name)
      age_quality_decision(item)
      item.sell_in -= 1
    end
  end

  private

  def below_max?(item)
    if item.quality < QUALITY_MAX
      item.quality = item.quality + 1
    end
  end

  def above_min?(item)
    if item.quality > QUALITY_MIN
      item.quality = item.quality - 1
    end
  end

  def backstage_pass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def backstage_pass_logic(item)
    if item.sell_in <= 0
      item.quality = 0
    else
      below_max?(item) if item.sell_in < 50
      below_max?(item) if item.sell_in < 11
      below_max?(item) if item.sell_in < 6
    end
  end

  def age_quality_increase(item)
    if backstage_pass?(item)
      backstage_pass_logic(item)
    else
      below_max?(item)
    end
  end

  def age_quality_decrease(item)
    above_min?(item)
    above_min?(item) if item.sell_in < 1
  end

  def age_quality_decision(item)
    if @Age_quality_increase.include?(item.name)
      age_quality_increase(item)
    else
      age_quality_decrease(item)
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
