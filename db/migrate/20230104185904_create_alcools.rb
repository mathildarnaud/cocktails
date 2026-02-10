class CreateAlcools < ActiveRecord::Migration[7.0]
  def change
    create_table :alcools do |t|
      t.string :name

      t.timestamps
    end
  end
end
