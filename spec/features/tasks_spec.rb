require "rails_helper"

RSpec.feature "Tasks", type: :feature do
  context "create new task" do
    scenario "should be successful" do
      visit new_task_path
      within("form") do
        fill_in "Title", with: '交報告'
        fill_in "Content", with: '財務金融期中報告'
        fill_in "Tag", with: '報告'
        fill_in "User", with: '3'  
        fill_in "Piority", with: '0'
        select '2020',from: 'task_start_1i'
        select 'May',from: 'task_start_2i'
        select '5',from: 'task_start_3i'
        select '00',from: 'task_start_4i'
        select '00',from: 'task_start_5i'
        select '2022',from: 'task_end_1i'
        select 'December',from: 'task_end_2i'
        select '11',from: 'task_end_3i'
        select '23',from: 'task_end_4i'
        select '59',from: 'task_end_5i'
        fill_in "State", with: '0'
      end
      click_button 'Create Task'
      expect(page).to have_content('Task was successfully created.')
    end
    scenario "should fail" do
    end
  end

  context "update task" do
    scenario "should be successful" do
      task=Task.create(title: '交報告',content: '財務金融期中報告',tag: '報告')
      visit edit_task_path(task)
      within('form') do
        fill_in "Title", with: '回家'
        fill_in "Content", with: '我不想讀書啦！！'
      end
      click_button 'Update Task'
      expect(page).to have_content 'Task was successfully updated.'
      expect(page).to have_content '回家'
    end
    scenario "should fail" do
    end
  end

  context "destroy task" do
    scenario "should be successful" do
      task=Task.create(title: '交報告',content: '財務金融期中報告',tag: '報告')
      visit tasks_path
        expect{ click_link 'Destroy'}.to change(Task, :count).by(-1)
      expect(page).to have_content 'Task was successfully destroyed.'
    end
    scenario "should fail" do
    end
  end
end
