# frozen_string_literal: true

# Create Mappings table
class CreateMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :mappings, id: :uuid do |t|
      t.string :name

      t.timestamps

      t.index ['name'], name: 'index_mappings_on_name'
    end
  end
end
