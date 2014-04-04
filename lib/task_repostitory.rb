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

  def update(update_id ,update_info)
    tasks = @db[:tasks]
    tasks.where(:id => update_id).update(update_info)
  end
end

#Updating the attributes of an existing task. This method will take a hash of
#the new attribute values. For example, if you only want to update the
#completed attribute, you would pass in {:completed => true}. If you want
#to update both, you would pass in {:name => "New Name", :completed => true} end

