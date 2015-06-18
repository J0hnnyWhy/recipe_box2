class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
    create_table(:ingredients) do |t|
      t.column(:ingredient_name, :string)
      t.timestamps()
    end
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
    end
  end
end
