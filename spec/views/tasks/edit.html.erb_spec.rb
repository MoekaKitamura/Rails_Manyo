# require 'rails_helper'

# RSpec.describe "tasks/edit", type: :view do
#   before(:each) do
#     @task = assign(:task, Task.create!(
#       task_name: "MyString",
#       to_do: "MyString",
#       status: "MyString",
#       priority: "MyString"
#     ))
#   end

#   it "renders the edit task form" do
#     render

#     assert_select "form[action=?][method=?]", task_path(@task), "post" do

#       assert_select "input[name=?]", "task[task_name]"

#       assert_select "input[name=?]", "task[to_do]"

#       assert_select "input[name=?]", "task[status]"

#       assert_select "input[name=?]", "task[priority]"
#     end
#   end
# end
