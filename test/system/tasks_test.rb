require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Content", with: @task.content
    fill_in "End", with: @task.end
    fill_in "Name", with: @task.name
    fill_in "Piority", with: @task.piority
    fill_in "Start", with: @task.start
    fill_in "State", with: @task.state
    fill_in "Tag", with: @task.tag
    fill_in "Title", with: @task.title
    fill_in "User", with: @task.user_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Content", with: @task.content
    fill_in "End", with: @task.end
    fill_in "Name", with: @task.name
    fill_in "Piority", with: @task.piority
    fill_in "Start", with: @task.start
    fill_in "State", with: @task.state
    fill_in "Tag", with: @task.tag
    fill_in "Title", with: @task.title
    fill_in "User", with: @task.user_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end