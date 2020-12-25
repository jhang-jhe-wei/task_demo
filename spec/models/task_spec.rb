require "rails_helper"

RSpec.describe Task, type: :model do
  context "validation tests" do
    it "ensures start_time date" do
      task = Task.new(title: "wells", start_time: DateTime.tomorrow, end_time: DateTime.now).save
      expect(task).to eq(false)
    end

    it "ensures end_time date" do
      task = Task.new(title: "wells", start_time: DateTime.now, end_time: DateTime.yesterday).save
      expect(task).to eq(false)
    end

    it "ensures title" do
      task = Task.new(start_time: DateTime.now, end_time: DateTime.tomorrow).save
      expect(task).to eq(false)
    end

    it "should save successfully" do
      task = Task.new(title: "wells", start_time: DateTime.now, end_time: DateTime.tomorrow).save
      expect(task).to eq(true)
    end
  end
end
