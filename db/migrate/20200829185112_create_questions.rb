# frozen_string_literal: true

# Create Questions
class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions, id: :uuid  do |t|
      t.integer :pri
      t.string :title, null: false
      t.integer :appears_day
      t.integer :frequency
      t.string :rating_type
      t.boolean :required
      t.string :conditions
      # Handling with enum
      t.integer :teaming_stages
      # Foreign keys
      t.uuid :role_id
      t.uuid :mapping_id

      t.timestamps

      t.index ['title'], name: 'index_questions_on_name'
    end
  end
end
