class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.references :company
      t.string :country, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :detail
      t.integer :floor

      t.timestamps
    end

    add_index :offices, [:country, :city]
  end
end
