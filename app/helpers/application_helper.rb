module ApplicationHelper
  def date_formatter(d)
    d.strftime("%I:%M %m/%d/%Y")
  end
end
