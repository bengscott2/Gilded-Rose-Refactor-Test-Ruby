class GildedRose

  QUALITY_MAX = 50
  QUALITY_MIN = 0

  def initialize(items)
    @items = items
    @Age_quality_increase = ["Backstage passes to a TAFKAL80ETC concert", "Aged Brie"]
    @Age_quality_decrease = []
    @Age_quality_does_not_change = ["Sulfuras, Hand of Ragnaros"]
  end

  def update_quality()
    @items.each do |item|
      next if @Age_quality_does_not_change.include?(item.name)


      if backstage_pass?(item)
        backstage_pass_logic(item)
      else
        if @Age_quality_increase.include?(item.name)
          below_max?(item)
        else
          above_min?(item)
        end
      end

      item.sell_in = item.sell_in - 1
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            above_min?(item)
          else
            item.quality = item.quality - item.quality
          end
        ## THIS IS QUALITY INCREASE
        else
          below_max?(item)
        end
      end

    end
  end

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
    below_max?(item) if item.sell_in < 50
    below_max?(item) if item.sell_in < 11
    below_max?(item) if item.sell_in < 6
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
