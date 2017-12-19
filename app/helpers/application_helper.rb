module ApplicationHelper
  def date_formatter(d)
    d.strftime("%I:%M %d/%m/%Y")
  end
end
