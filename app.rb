require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/') do
  @new_recipe = Recipe.create({:name => params.fetch("recipe_title")})
  @id = @new_recipe.id()
  @recipe = Recipe.find(@id)
  @recipe.save
  @ingredients = Ingredient.all()
  @recipes = Recipe.all
  erb(:index)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @ingredients = Ingredient.all()
  erb(:recipe)
end

get('/recipe/:id') do
  @id = params.fetch('id')
  @recipe = Recipe.find(@id)
  @ingredients = @recipe.ingredients()
  @categories = @recipe.categories()
  erb(:recipe_info)
end

get('/add_ingredients/') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredient_save/') do
  Ingredient.create({:ingredient_name => params.fetch("ingredient_name")})
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

delete('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.destroy()
  @recipes = Recipe.all()
  erb(:index)
end

patch('/save_recipe/') do
  @new_recipe = Recipe.find(params.fetch('id'))
  @ingredient_ids = params.fetch('ingredient_ids')
  @ingredient_ids.each do |ingredient_id|
    @new_ingredient = Ingredient.find(ingredient_id)
    @new_recipe.ingredients.push(@new_ingredient)
  end
  @recipe = @new_recipe
  @ingredients = @recipe.ingredients()
  erb(:recipe_info)
end
