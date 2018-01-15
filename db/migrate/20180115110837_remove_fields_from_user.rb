class RemoveFieldsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :fullname, :string
    remove_column :users, :biography, :string
    remove_column :users, :slug, :string
    remove_column :users, :role, :integer
  end
end
