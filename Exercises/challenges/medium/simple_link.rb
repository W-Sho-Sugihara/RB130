class Element
  attr_reader :next_element, :value

  def initialize(value, next_element = nil)
    @value = value
    @next_element = next_element
  end

  def next
    next_element
  end

  def datum
    value
  end

  def tail?
    if next_element
      false
    else
      true
    end
  end

end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    size = 0
    cur_el = list.first
    while cur_el
      size += 1
      cur_el = cur_el.next
    end
    size
  end

  def empty?
    list.empty?
  end

  def push(value)
    list.unshift(Element.new(value, list.first))
  end

  def peek
    list[0] ? list.first.datum : nil 
  end

  def head
    list.first
  end

  def pop
    list.shift.datum
  end

  def self.from_a(arr = [])
    arr = arr.dup
    el = SimpleLinkedList.new
    return el if arr.nil?

    arr.size.times do 
      cur_el = arr.pop
      el.list.unshift( Element.new(cur_el, el.list.first))
    end
    el
  end

  def to_a
    results = []
    current_el = list.first
    while current_el
      results << (current_el.datum)
      current_el = current_el.next
    end
    results
  end

  def reverse
    # SimpleLinkedList.from_a(list.to_a.reverse)
    reversed = SimpleLinkedList.new
    current_el = list.first
    while current_el
      reversed.list.unshift(Element.new(current_el.datum, reversed.list.first))
      current_el = current_el.next
    end
      reversed
  end
end

