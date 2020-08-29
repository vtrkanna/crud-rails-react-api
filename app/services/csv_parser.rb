# frozen_string_literal: true

# CSV Parser
class CsvParser
  require 'csv'

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def rows
    rows = []
    errors = nil
    status = true
    return status, errors, rows
  end
end
