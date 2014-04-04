require "rspec"
require_relative "../lib/task_repostitory"

describe "Manages tasks" do

  it "Allows the user to insert a row into the table" do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = TaskRepository.new(db)
    db.create_table! :tasks do
      primary_key :id
      String :task
      BOOLEAN :completed, :default => false
    end

    tasks.add_task({:id => 1, :task => 'do_stuff'})
    tasks.add_task({:id => 2, :task => 'do_more_stuff'})
    expected = [{:id => 1, :task => 'do_stuff', :completed => false}, {:id => 2, :task => 'do_more_stuff', :completed => false}]
    expect(tasks.show_all).to eq(expected)
  end

  it "Allow the user to update valuen in the table" do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = TaskRepository.new(db)
    db.create_table! :tasks do
      primary_key :id
      String :task
      BOOLEAN :completed, :default => false
    end
    tasks.add_task({:id => 1, :task => 'do_stuff'})
    tasks.add_task({:id => 2, :task => 'do_more_stuff'})
    tasks.update(1,{:task => 'do lots of stuff', :completed => true})
    expected = [{:id => 2, :task => 'do_more_stuff', :completed => false},{:id => 1, :task => 'do lots of stuff', :completed => true}]
    expect(tasks.show_all).to eq(expected)

  end
end