class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    @next = nil
    @prev = nil
  end
end

class LinkedList
  attr_reader :tail
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next # Sentinel head
  end

  def last
    @tail.prev # Sentinel tail
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |curr_link|
      return curr_link.val if curr_link.key == key
    end
    nil
  end

  def include?(key)
    self.each do |curr_link|
      return true if curr_link.key == key
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link
    new_link
  end

  def update(key, val)
    self.each do |curr_link|
      curr_link.val = val if curr_link.key == key
    end
  end

  def remove(key)
    self.each do |curr_link|
      if curr_link.key == key
        curr_link.remove
        break
      end
    end
  end

  def each
    curr_link = @head
    until curr_link.next == @tail
      curr_link = curr_link.next
      yield curr_link
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
