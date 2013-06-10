module ApplicationHelper

  def sortable_column(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "active #{sort_direction}" : 'inactive'
    css_id = column if sort_column
    direction = column == sort_column && sort_direction == 'desc' ? 'asc' : 'desc'
    link_to title, { sort: column, direction: direction }, { class: css_class, id: css_id }
  end
end
