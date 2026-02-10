class AddAltToAlcool < ActiveRecord::Migration[7.0]
  def change
    add_column :alcools, :alt, :string
  end
end
