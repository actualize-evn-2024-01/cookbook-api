require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "ingredients_list" do
    recipe = Recipe.new(ingredients: "one, two, three")
    assert_equal ["one", "two", "three"], recipe.ingredients_list
  end

  test "directions_list" do
    recipe = Recipe.new(directions: "one, two, three")
    assert_equal ["one", "two", "three"], recipe.directions_list
  end

  test "friendly_created_at" do
    recipe = Recipe.new(created_at: "2000-01-01")
    assert_equal "January  1, 2000", recipe.friendly_created_at
  end

  test "friendly_prep_time" do
    recipe = Recipe.new(prep_time: 200)
    assert_equal "3 hour(s) 20 minute(s)", recipe.friendly_prep_time
  end
end
