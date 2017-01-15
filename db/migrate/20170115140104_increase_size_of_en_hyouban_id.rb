class IncreaseSizeOfEnHyoubanId < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        change_column :en_hyouban_entries, :en_hyouban_id, :integer, limit: 8, null: false
      end
      dir.down do
        change_column :en_hyouban_entries, :en_hyouban_id, :integer, limit: 4
      end
    end
  end
end
