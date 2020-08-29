# == Schema Information
#
# Table name: mappings
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_mappings_on_name  (name)
#
class MappingSerializer < ActiveModel::Serializer
  attributes :id
end