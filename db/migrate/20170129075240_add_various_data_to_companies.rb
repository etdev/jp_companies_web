class AddVariousDataToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :custom_categories, :string
    add_column :companies, :founded_at, :datetime
    add_column :companies, :is_enabled, :boolean, null: false, default: true
    add_column :companies, :is_hiring, :boolean
    add_column :companies, :is_public, :boolean
    add_column :companies, :is_profitable, :boolean
    add_column :companies, :japanese_level, :integer
    add_column :companies, :main_location, :string
  end
end
