require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        task_name: "Task Name",
        to_do: "To Do",
        status: "Status",
        priority: "Priority"
      ),
      Task.create!(
        task_name: "Task Name",
        to_do: "To Do",
        status: "Status",
        priority: "Priority"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", text: "Task Name".to_s, count: 2
    assert_select "tr>td", text: "To Do".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Priority".to_s, count: 2
  end
end
