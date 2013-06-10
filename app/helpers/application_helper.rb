module ApplicationHelper

  def sortable_column(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "#{sort_direction} active" : 'inactive'
    css_id = column if sort_column
    direction = column == sort_column && sort_direction == 'desc' ? 'asc' : 'desc'
    chevron = direction == 'asc' ? 'icon-chevron-down' : 'icon-chevron-up'
    render 'link',  title: title, column: column, css_class: css_class,
                    css_id: css_id, direction: direction, chevron: chevron
  end
end
