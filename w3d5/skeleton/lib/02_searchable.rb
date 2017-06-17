require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    col_names = params.keys.join(" = ? AND ") + " = ?"
    attribute_values = params.values
    results = DBConnection.execute(<<-SQL, *attribute_values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{col_names}
    SQL
    results.map { |result| self.new(result) }
  end
end

class SQLObject
  extend Searchable
end
