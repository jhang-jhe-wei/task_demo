require "rails_helper"

RSpec.describe Task, type: :model do
  context "validation tests" do
    it "ensures start date" do
      task = Task.new(title: "wells", start: DateTime.tomorrow, end: DateTime.now).save
      expect(task).to eq(false)
    end

    it "ensures end date" do
      task = Task.new(title: "wells", start: DateTime.now, end: DateTime.yesterday).save
      expect(task).to eq(false)
    end

    it "ensures title" do
      task = Task.new(start: DateTime.now, end: DateTime.tomorrow).save
      expect(task).to eq(false)
    end

    it "should save successfully" do
      task = Task.new(title: "wells", start: DateTime.now, end: DateTime.tomorrow).save
      expect(task).to eq(true)
    end
  end
end
