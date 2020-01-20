require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = tags(:one)
  end

  test"tag should be valid" do
    assert @tag.valid?
  end

  test "label should be present" do
    @tag.label = "   "
    assert_not @tag.valid?
  end
end
