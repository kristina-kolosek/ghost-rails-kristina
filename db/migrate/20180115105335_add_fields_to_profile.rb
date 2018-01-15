class AddFieldsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :fullname, :string
    add_column :profiles, :slug, :string, unique: true
    add_column :profiles, :role, :integer
    add_column :profiles, :biography, :string
  end
end
