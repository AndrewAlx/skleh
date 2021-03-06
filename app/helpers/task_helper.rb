module TaskHelper
  def table_for_query_rows(query_rows)
    result = "<table>"
    result << "<thead>"
    result << "<tr>"
    query_rows.columns.map do |column|
      result << "<th><span>#{column}</span></th>"
    end
    result << "</tr>"
    result << "</thead>"

    result << "<tbody>"
    query_rows.rows.map do |row|
      result << "<tr>"
      row.map do |field|
        result << "<td>#{field}</td>"
      end
      result << "</tr>"
    end
    result << "</tbody>"

    return result.html_safe
  end
end
