require "spec_helper"

describe CommentsHelper do
  describe "is this is the comment creator" do
    it "returns true" do
      helper.isCommentCreator.should be_true
    end
  end
end