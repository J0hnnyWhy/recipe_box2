require('spec_helper')

describe(Recipe) do
    describe('#ingredients') do
      it('returns the ingredients in the recipe') do
        test_recipe = Recipe.create({:name => 'Lemon Curd Tart'})
        test_ingredient1 = test_recipe.ingredients.create({:ingredient_name => "spinach"})
    test_ingredient2 = test_recipe.ingredients.create({:ingredient_name => "tomato"})
    expect(test_recipe.ingredients).to(eq([test_ingredient1, test_ingredient2]))
    end
  end

  it("converts the name to capitalize") do
    recipe = Recipe.create({:name => "wings"})
    expect(recipe.name()).to(eq("Wings"))
  end


  it('validates presence of name') do
    recipe = Recipe.new({:name => ''})
    expect(recipe.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    recipe = Recipe.new({:name => 'b'*(51)})
    expect(recipe.save).to(eq(false))
  end
end
