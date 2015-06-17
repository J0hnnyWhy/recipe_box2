require('spec_helper')

describe(Ingredient) do

  it('validates presence of name') do
    ingredient = Ingredient.new(ingredient_name: '')
    expect(ingredient.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    ingredient = Ingredient.new(ingredient_name: 'b'*(51))
    expect(ingredient.save).to(eq(false))
  end
end
