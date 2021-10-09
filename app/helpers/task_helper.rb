module TaskHelper
  def table_for_query_rows(query_rows)
    result = "<table border='1'>"
    result << "<tr>"
    query_rows.columns.map do |column|
      result << "<th>#{column}</th>"
    end
    result << "</tr>"
    query_rows.rows.map do |row|
      result << "<tr>"
      row.map do |field|
        result << "<td>#{field}</td>"
      end
      result << "</tr>"
    end

    return result.html_safe
  end
end
