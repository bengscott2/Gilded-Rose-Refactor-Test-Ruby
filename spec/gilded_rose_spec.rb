require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end
    describe 'Aged brie' do
      context 'Only Item is Aged Brie with sellIn above 0 and quality below 50' do
        it 'will increase quality by 1 and decrease sell_in by 1' do
          items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 1

          expect(items[0].quality).to eq 1
        end
      end

      context 'Only Item is Aged Brie with sellIn above 0 and quality att 50' do
        it 'will not increase quality and decrease sell_in by 1' do
          items = [Item.new(name="Aged Brie", sell_in=2, quality=50)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 1
          expect(items[0].quality).to eq 50
        end
      end
    end

    describe 'Sulfuras' do
      context 'Only Item is Sulfuras' do
        it 'will have no change in quality or sell_in' do
          items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=1, quality=80)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 1
          expect(items[0].quality).to eq 80
        end
      end
    end

    describe 'Backstage passes' do
      context 'Only Item is Backstage pass with more than 10 sellIn left' do
        it 'will increase in quality by 1' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 14
          expect(items[0].quality).to eq 21
        end

        it 'will not increase in quality by 1 as it has reached its limit' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=50)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 14
          expect(items[0].quality).to eq 50
        end
      end

      context 'Only Item is Backstage pass with less than 10 sellIn left' do
        it 'will increase in quality by 2' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=8, quality=20)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 7
          expect(items[0].quality).to eq 22
        end

        it 'will not increase in quality by 1 as it has reached its limit' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=50)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 14
          expect(items[0].quality).to eq 50
        end
      end

      context 'Only Item is Backstage pass with less than 5 sellIn left' do
        it 'will increase in quality by 3' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=3, quality=20)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 2
          expect(items[0].quality).to eq 23
        end

        it 'will not increase in quality by 1 as it has reached its limit' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=50)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 14
          expect(items[0].quality).to eq 50
        end
      end

      context 'Only Item is Backstage pass with 0 sellIn' do
        it 'will set quality to 0' do
          items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=20)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 0
        end
      end
    end

    describe 'normal items' do
      context 'Only Item is normal with more than 0 sellIn and quality above 0' do
        it 'will decrease by quality and sell_in by 1' do
          items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 4
          expect(items[0].quality).to eq 6
        end
      end

      context 'Only Item is normal with 0 sellIn and quality above 0' do
        it 'will decrease by quality by 1 and sell_in by 2' do
          items = [Item.new(name="Elixir of the Mongoose", sell_in=0, quality=7)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 5
        end
      end

      context 'Only Item is normal with 0 sellIn and quality is 0' do
        it 'will decrease by quality but quality will stay at 0' do
          items = [Item.new(name="Elixir of the Mongoose", sell_in=0, quality=0)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq -1
          expect(items[0].quality).to eq 0
        end
      end

      context 'Only Item is normal with -1 sellIn and quality is 1' do
        it 'will decrease sellIn by 1 but quality will stop at 0' do
          items = [Item.new(name="Elixir of the Mongoose", sell_in=-1, quality=0)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq -2
          expect(items[0].quality).to eq 0
        end
      end
    end
  end

end
