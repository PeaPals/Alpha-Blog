require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert !@category.valid?
  end

  test "name should be unique" do
    @category.save
    @category_2 = Category.new(name: "sports")
    assert !@category_2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert !@category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert !@category.valid?
  end


end
