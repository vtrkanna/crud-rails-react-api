# frozen_string_literal: true

# CSV Parser
class CsvParser
  require 'csv'

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def rows
    rows = []
    invalid = []
    CSV.foreach(@csv_file.path, headers: true) do |row|
      role = Role.find_by_name(row[6])
      mapping = Mapping.find_by_name(row[9])
      if role.present? & mapping.present? & row[1].present?
        rows << {
          pri: row[0],
          title: row[1],
          teaming_stages: row[2],
          appears_day: row[3],
          frequency: row[4],
          rating_type: row[5],
          role_id: role.id,
          required: row[7],
          conditions: row[8],
          mapping_id: mapping.id,
        }
      else
        invalid << { pri: row[0], title: row[1]}
      end
    end

    if invalid.blank?
      errors = nil
      status = true
    else
      errors = "#{invalid.count} rows not updated"
      status = false
    end
    return status, errors, rows
  end
end
