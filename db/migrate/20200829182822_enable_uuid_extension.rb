# frozen_string_literal: true

# Enable Uuid extention
class EnableUuidExtension < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
  end
end
