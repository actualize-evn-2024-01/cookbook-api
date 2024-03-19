class Recipe < ApplicationRecord
  belongs_to :user

  def ingredients_list
    split_ingredients = ingredients.split(", ")
    result = []
    index = 0
    while index < split_ingredients.length
      result.push(split_ingredients[index].downcase)
      index += 1
    end
    result
  end

  def directions_list
    split_directions = directions.split(", ")
    result = []
    index = 0
    while index < split_directions.length
      result.push(split_directions[index].downcase)
      index += 1
    end
    result
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    result += "#{hours} hour(s) " if hours > 0
    result += "#{minutes} minute(s)" if minutes > 0
    result
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end
end
