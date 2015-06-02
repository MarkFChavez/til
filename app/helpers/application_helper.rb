module ApplicationHelper
  def render_day(day)
    return "LATEST" if day == Date.today
    return day.strftime("%B %d, %Y") if day.present?
  end
end
