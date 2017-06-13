require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map[key])
      @map[key].val
    else
      eject! if count == @max
      new_val = calc!(key)
      new_link = @store.append(key, new_val)
      @map[key] = new_link
      new_val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @prc.call(key)
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    link.prev.next = link.next
    link.next.prev = link.prev

    link.prev = @store.last
    link.next = @store.last.next
    @store.last.next = link
    link.next.prev = link
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
