module Checks
  QUALITY_MAX = 50
  QUALITY_MIN = 0

  def below_max?(item)
    if item.quality < QUALITY_MAX
      item.quality += 1
    end
  end

  def above_min?(item)
    if item.quality > QUALITY_MIN
      item.quality -= 1
    end
  end
end
