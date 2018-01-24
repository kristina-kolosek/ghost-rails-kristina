class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :slug, unique: true
      t.text :biography

      t.timestamps
    end
  end
end
