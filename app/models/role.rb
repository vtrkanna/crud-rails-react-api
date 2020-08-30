# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_roles_on_name  (name)
#
# Role
class Role < ApplicationRecord

  # Relationships
  has_many :questions

  validates :name, uniqueness: true
end
