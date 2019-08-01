require_relative 'item_parent.rb'
require_relative 'item.rb'
require 'pry'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decide_on_item(item).update_quality
    end
  end


  private

  def decide_on_item(item)
    case item.name
    when "Backstage passes to a TAFKAL80ETC concert"
      BackstagePass.new(item)
    when "Aged Brie"
      Brie.new(item)
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras.new(item)
    else
      Normal.new(item)
    end
  end
end
