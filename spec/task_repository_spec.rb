require "rspec"
require_relative "../lib/task_repostitory"

describe "Manages tasks" do

  it "Allows the user to insert a row into the table" do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = TaskRepository.new(db)
    db.create_table! :tasks do
      primary_key :id
      String :task
    end

    tasks.add_task({:id => 1, :task => 'do_stuff'})
    tasks.add_task({:id => 2, :task => 'do_more_stuff'})
    actual = [{:id => 1, :task => 'do_stuff'}, {:id => 2, :task => 'do_more_stuff'}]
    expect(tasks.show_all).to eq(actual)
  end
end