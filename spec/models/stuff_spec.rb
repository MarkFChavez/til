require "rails_helper"

describe Stuff do
  context "validations" do
    it "requires content" do
      stuff = Stuff.new
      expect(stuff).not_to be_valid
    end
  end
end
