# frozen_string_literal: true

# Create Roles
class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles, id: :uuid  do |t|
      t.string :name

      t.timestamps

      t.index ['name'], name: 'index_roles_on_name'
    end
  end
end
