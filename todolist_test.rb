require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_TypeError
    assert_raises(NotTodoError) { @list.add('string')}
    assert_raises(NotTodoError) { @list.add(0)}
  end

  def test_shovel
    new_todo = Todo.new('Do laundry')
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new('Feed the cat')
    @list.add new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) {@list.item_at(@list.size)}
    assert_equal(@todo1, @list.item_at(0))
  end

  def mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(@list.size)}
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def mark_undone_at
    assert_raises(IndexError) {@list.mark_done_at(@list.size)}
    @todo1.done!

    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@list.size)}
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = 
    <<~OUTPUT.chomp
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)  
  end

  def test_to_s
    output = 
    <<~OUTPUT.chomp
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s) 
  end

  def test_to_s
    output = 
    <<~OUTPUT.chomp
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s) 
  end

  def test_each
    @list.each {|todo| todo.done!}

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_each
    assert_equal(@list, @list.each {|x| nil })
  end

  def test_select
    @list.mark_done_at(0)
    selected = @list.select { |todo| todo.done? }

    assert_equal(@todo1, selected.item_at(0))
  end
end