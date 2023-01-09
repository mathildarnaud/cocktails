class CreateCocktails < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :instruction
      t.string :image
      t.string :ingredient1
      t.string :ingredient2
      t.string :ingredient3
      t.string :ingredient4
      t.string :ingredient5
      t.string :ingredient6
      t.string :ingredient7
      t.string :ingredient8
      t.string :ingredient9
      t.string :ingredient10
      t.string :ingredient11
      t.string :ingredient12
      t.string :ingredient13
      t.string :ingredient14
      t.string :ingredient15
      t.string :measure1
      t.string :measure2
      t.string :measure3
      t.string :measure4
      t.string :measure5
      t.string :measure6
      t.string :measure7
      t.string :measure8
      t.string :measure9
      t.string :measure10
      t.string :measure11
      t.string :measure12
      t.string :measure13
      t.string :measure14
      t.string :measure15
      t.references :alcool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
