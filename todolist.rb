# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class NotTodoError < StandardError
  def initialize(msg = "Only objects of the Todo class may be added.")
    super
  end
end

class IndexError < StandardError
  def initialize(msg = "No task at that index")
    super
  end
end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise NotTodoError unless todo.instance_of? Todo

    @todos << todo 
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    # todos.map(&:title)
    todos.clone
  end

  def done?
    todos.all? {|each| each.done?}
  end

  def item_at(index)
    raise IndexError unless todos[index]
    
    todos[index]
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.map(&:done!)
  end

  def shift
    result = item_at(0)
    todos.delete_at(0)
    result
  end

  def pop
    result = item_at(-1)
    todos.delete_at(-1)
    result
  end

  def remove_at(index)
    result = item_at(index)
    todos.delete(item_at(index))
    result
  end

  def to_s
    todos.map do |todo|
      todo.to_s
    end.join("\n")
  end

  def each
    counter = 0

    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  def select
    counter = 0
    results = TodoList.new(title)

    while counter < todos.size
      results << todos[counter] if yield(todos[counter])
      counter += 1
    end

    results
  end

  def find_by_title(string)
    select { |todo| todo.title == string }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(string)
    find_by_title(string).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private

  attr_reader :todos

end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list

list.mark_done('Clean room')

p list.all_done
p list.all_not_done