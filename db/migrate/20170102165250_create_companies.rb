class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false, default: ''
      t.string :name_jp, null: false, default: ''
      t.string :name_kana, null: false, default: ''
      t.integer :employees_count, null: false, default: 0
      t.timestamps
    end

    add_index :companies, :name
    add_index :companies, :name_kana
  end
end
