require "rails_helper"

RSpec.describe Task, type: :model do
  context "validation tests" do
    it "destroy tasks by user" do
      user = User.create(name: "tester", email: "jhang0912407249@gmail.com", phone: "0912407249", password: "123456")
      user.tasks.create(title: "wells", start_time: DateTime.now, end_time: DateTime.tomorrow)
      user.tasks.create(title: "wells", start_time: DateTime.now, end_time: DateTime.tomorrow)
      user.tasks.create(title: "wells", start_time: DateTime.now, end_time: DateTime.tomorrow)
      expect(Task.count).to eq(3)
      user.destroy
      expect(Task.count).to eq(0)
    end

    it "check destory user admin" do
      user1 = User.create(name: "tester", email: "jhang0912407249@gmail.com", phone: "0912407249", password: "123456", admin: true)
      user2 = User.create(name: "wells", email: "jhang0912407249@gmail.com", phone: "0912407249", password: "123456", admin: true)
      expect(User.count).to eq(2)
      user1.destroy
      expect(User.count).to eq(1)
      user2.destroy
      expect(User.count).to eq(1)
    end
  end
end
