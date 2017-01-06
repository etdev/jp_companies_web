class CreateEnHyoubanEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :en_hyouban_entries do |t|
      t.references :company
      t.integer :en_hyouban_id
      t.string :name, null: false, default: ''
      t.integer :average_salary, null: false, default: 0
      t.string :location, null: false, default: ''
      t.string :url, null: false, default: ''
      t.integer :rating, null: false, default: 0
      t.integer :ratings_count, null: false, default: 0
      t.string :daily_hours_worked, null: false, default: ''
      t.string :category, null: false, default: ''

      t.timestamps
    end

    add_index :en_hyouban_entries, :en_hyouban_id, unique: true
  end
end
