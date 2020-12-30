require "rails_helper"

RSpec.describe Task, type: :model do
  context "validation tests" do
    it "ensures start_time date" do
      user = User.create
      task = user.tasks.new(title: "wells", start_time: DateTime.tomorrow, end_time: DateTime.now).save
      expect(task).to eq(false)
    end

    it "ensures end_time date" do
      user = User.create
      task = user.tasks.new(title: "wells", start_time: DateTime.now, end_time: DateTime.yesterday).save
      expect(task).to eq(false)
    end

    it "ensures title" do
      user = User.create
      task = user.tasks.new(start_time: DateTime.now, end_time: DateTime.tomorrow).save
      expect(task).to eq(false)
    end

    it "should save successfully" do
      user = User.create
      task = user.tasks.new(title: "wells", start_time: DateTime.now, end_time: DateTime.tomorrow).save
      expect(task).to eq(true)
    end
    it "check destory tag by task" do
      user = User.create(name: "wells", email: "jhang0912407249@gmail.com", phone: "0912407249", password: "123456")
      task = user.tasks.create(title: "wells", start_time: DateTime.now, end_time: DateTime.tomorrow)
      tag = task.tags.create(name: "test")
      tag = task.tags.create(name: "test1")
      expect(Tag.count).to eq(2)
      user.tasks.destroy_all
      expect(Tag.count).to eq(2)
    end
  end
end
