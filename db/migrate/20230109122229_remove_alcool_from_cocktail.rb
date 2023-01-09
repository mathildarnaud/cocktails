class RemoveAlcoolFromCocktail < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cocktails, :alcool, null: false, foreign_key: true
  end
end
