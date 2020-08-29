# == Schema Information
#
# Table name: questions
#
#  id             :uuid             not null, primary key
#  appears_day    :integer
#  conditions     :string
#  frequency      :integer
#  pri            :integer
#  rating_type    :string
#  required       :boolean
#  teaming_stages :integer
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  mapping_id     :uuid
#  role_id        :uuid
#
# Indexes
#
#  index_questions_on_name  (title)
#
class QuestionSerializer < ActiveModel::Serializer
  attributes :id
end
