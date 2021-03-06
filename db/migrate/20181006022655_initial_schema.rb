class InitialSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string  :full_url, null: false
      t.string  :slug, null: false
      t.integer :stat_clicked_count, null: false, default: 0

      t.timestamps
    end

    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type]
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
    add_index :friendly_id_slugs, :sluggable_type
  end
end
