require "rails_helper"

RSpec.feature "Tasks", type: :feature do
  context "create new task" do
    scenario "should be successful" do
      visit new_task_path
      within("form") do
        fill_in "task_title", with: '交報告'
        fill_in "task_content", with: '財務金融期中報告'
        fill_in "task_tag", with: '報告'
        fill_in "User", with: '3'  
        select '2020',from: 'task_start_1i'
        select '5月',from: 'task_start_2i'
        select '5',from: 'task_start_3i'
        select '00',from: 'task_start_4i'
        select '00',from: 'task_start_5i'
        select '2022',from: 'task_end_1i'
        select '11月',from: 'task_end_2i'
        select '11',from: 'task_end_3i'
        select '23',from: 'task_end_4i'
        select '59',from: 'task_end_5i'
        select "#{I18n.t "low"}",from: 'task_piority'
        select "#{I18n.t "pending"}",from: 'task_state'
      end
      click_button "#{I18n.t "create_task"}"
      expect(page).to have_content(I18n.t 'c_task_happy')
    end
    scenario "should fail" do
      visit new_task_path
      within("form") do
        fill_in "task_content", with: '財務金融期中報告'
        fill_in "task_tag", with: '報告'
        fill_in "User", with: '3'  
        select '2020',from: 'task_start_1i'
        select '5月',from: 'task_start_2i'
        select '5',from: 'task_start_3i'
        select '00',from: 'task_start_4i'
        select '00',from: 'task_start_5i'
        select '2022',from: 'task_end_1i'
        select '11月',from: 'task_end_2i'
        select '11',from: 'task_end_3i'
        select '23',from: 'task_end_4i'
        select '59',from: 'task_end_5i'
        select "#{I18n.t "low"}",from: 'task_piority'
        select "#{I18n.t "pending"}",from: 'task_state'
      end
      click_button "#{I18n.t "create_task"}"
      expect(page).to have_content(I18n.t 'c_task_bad')
    end
  end

  context "update task" do
    scenario "should be successful" do
      task=Task.create(title: '交報告',content: '財務金融期中報告',tag: '報告', start: DateTime.now, end: DateTime.tomorrow)
      visit edit_task_path(task)
      within('form') do
        fill_in "task_title", with: '回家'
        fill_in "task_content", with: '我不想讀書啦！！'
      end
      click_button "#{I18n.t "create_task"}"
      expect(page).to have_content I18n.t 'u_task_happy'
      expect(page).to have_content '回家'
    end
    scenario "should fail" do
    end
  end

  context "destroy task" do
    scenario "should be successful" do
      task=Task.create(title: '交報告',content: '財務金融期中報告',tag: '報告', start: DateTime.now, end: DateTime.tomorrow)
      visit tasks_path
        expect{ click_link "#{I18n.t "destroy"}"}.to change(Task, :count).by(-1)
      expect(page).to have_content I18n.t 'd_task_happy'
    end
    scenario "should fail" do
    end
  end

  context "tasks sort by create_date" do
    scenario "should be successful" do
      task1=Task.create(title: '交報告', start: DateTime.now, end: DateTime.tomorrow)
      task2=Task.create(title: '讀書', start: DateTime.now, end: DateTime.tomorrow)
      task3=Task.create(title: '煮飯', start: DateTime.now, end: DateTime.tomorrow)
      task1.id = 20
      task1.save
      task2.id = 10
      task2.save
      expect(Task.first.title).to eq '煮飯'
      expect(Task.second.title).to eq '讀書'
      expect(Task.third.title).to eq '交報告'
      visit tasks_path
      strs = page.text.split " "
      # puts strs
      expect(strs[9]).to eq '交報告'
      expect(strs[19]).to eq '讀書'
      expect(strs[29]).to eq '煮飯'
    end
  end

  context "tasks clean" do
    scenario "should be empty" do
      expect(Task.all).to be_empty
    end
  end
end
