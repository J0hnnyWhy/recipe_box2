class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  validates(:name, {:presence => true, :length => {:minimum => 2, :maximum => 50}})
  before_save(:capitalize_name)

  scope(:not_done, -> do
    where({done => false})
  end)

  private

  define_method(:capitalize_name) do
    self.name=(name().capitalize())
  end
end
