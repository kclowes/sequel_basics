require "sequel"

class TaskRepository

  def initialize(db)
    @db = db
  end

  def add_task(task_to_add)
    tasks = @db[:tasks]
    tasks.insert(task_to_add)
  end

  def show_all
    tasks = @db[:tasks]
    tasks.all
  end
end

