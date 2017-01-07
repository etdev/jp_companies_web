class ChangeVorkersEntriesMakeIdString < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        change_column :vorkers_entries, :vorkers_id, :string
        change_column_default :vorkers_entries, :vorkers_id, from: 0, to: ''
      end

      dir.down do
        change_column :vorkers_entries, :vorkers_id, :integer, null: false, default: 0
        change_column_default :vorkers_entries, :vorkers_id, from: '', to: 0
      end
    end
  end
end
