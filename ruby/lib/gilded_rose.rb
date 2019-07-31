class GildedRose

  def initialize(items)
    @items = items
    @Age_quality_increase = ["Backstage passes to a TAFKAL80ETC concert", "Aged Brie"]
    @Age_quality_decrease = []
    @Age_quality_does_not_change = ["Sulfuras, Hand of Ragnaros"]
  end

  def update_quality()
    @items.each do |item|
      next if @Age_quality_does_not_change.include?(item.name)


      if @Age_quality_increase.include?(item.name)
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      else
        if item.quality > 0
          item.quality = item.quality - 1
        end
      end

      ##THIS CHECKS IF QUALITY CHANGE SHOULD HAPPEN AGAIN SO X2 IF PASSED SELL IN DATE
      ## THIS IS QUALITY DECREASE
      item.sell_in = item.sell_in - 1
      #checks for items that have less than 0 sell_in
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              item.quality = item.quality - 1
            end
          else
            item.quality = item.quality - item.quality
          end
        ## THIS IS QUALITY INCREASE
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

  def at_max?(item)
    item.quality < QUALITY_MAX
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

#
