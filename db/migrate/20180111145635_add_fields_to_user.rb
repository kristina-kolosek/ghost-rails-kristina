class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fullname, :string
    add_column :users, :biography, :string
    add_column :users, :slug, :string, unique: true
    add_column :users, :role, :integer
  end
end
