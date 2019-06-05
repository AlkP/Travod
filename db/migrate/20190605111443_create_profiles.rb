class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :first_name, null: true
      t.string :last_name, null: true
      t.string :country, null: true
      t.string :source, null: false, index: true
      t.string :source_link, null: false

      t.jsonb :language, null: false, default: {}

      t.timestamps
    end
  end
end
