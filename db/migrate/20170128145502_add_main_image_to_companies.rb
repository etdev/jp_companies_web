class AddMainImageToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :main_image_url, :string, after: :employees_count
    add_column :companies, :rating, :integer, null: false, default: 0, after: :employees_count
  end
end
