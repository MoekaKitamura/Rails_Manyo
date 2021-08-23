require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      task_name: "MyString",
      to_do: "MyString",
      status: "MyString",
      priority: "MyString"
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[task_name]"

      assert_select "input[name=?]", "task[to_do]"

      assert_select "input[name=?]", "task[status]"

      assert_select "input[name=?]", "task[priority]"
    end
  end
end
