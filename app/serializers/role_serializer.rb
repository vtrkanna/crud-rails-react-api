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
class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name

  cache key: 'roles', expires_in: 3.hours
end
