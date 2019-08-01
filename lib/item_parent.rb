require_relative 'checks.rb'

class ItemParent
  include Checks

  def initialize(item)
    @item = item
  end

  def update_quality
  end
end

class Sulfuras < ItemParent
end

class Brie < ItemParent
  def update_quality
    below_max?(@item)
    @item.sell_in -= 1
  end
end

class BackstagePass < ItemParent
  def update_quality
    if @item.sell_in <= 0
      @item.quality = 0
    else
      below_max?(@item) if @item.sell_in < 50
      below_max?(@item) if @item.sell_in < 11
      below_max?(@item) if @item.sell_in < 6
    end
    @item.sell_in -= 1
  end
end

class Normal < ItemParent
  def update_quality
    above_min?(@item)
    above_min?(@item) if @item.sell_in < 1
    @item.sell_in -= 1
  end
end
