module ApplicationHelper
  def render_if(condition, template, record)
    render template, record if condition
  end

  def display_msg
    concat content_tag(:div, alert, class: 'alert alert-danger') if alert.present?
    content_tag(:div, notice, class: 'alert alert-success') if notice.present?
  end
end
