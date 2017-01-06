class CreateVorkersEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :vorkers_entries do |t|
      t.references :company
      t.integer :vorkers_id, null: false
      t.string :name, null: false, default: ''
      t.string :url, null: false, default: ''
      t.decimal :rating, precision: 3, scale: 2, null: false, default: 0
      t.integer :ratings_count, null: false, default: 0
      t.decimal :monthly_overtime, precision: 5, scale: 2, null: false, default: 0
      t.decimal :percent_vacation_used, precision: 5, scale: 2, null: false, default: 0
      t.string :category, null: false, default: ''
      t.string :thumbnail_url, null: false, default: ''
      t.string :stock_info, null: false, default: ''

      t.timestamps
    end

    add_index :vorkers_entries, :vorkers_id, unique: true
  end
end
