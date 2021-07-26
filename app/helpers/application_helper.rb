module ApplicationHelper
  def render_svg(name, options = {})
    options[:title] ||= name.underscore.humanize
    options[:aria] = true
    options[:nocomment] = true
    options[:class] = options.fetch(:styles, "fill-current text-gray-500")

    filename = "#{name}.svg"
    inline_svg_tag(filename, options)
  end

  def humanized_address(resource)
    "#{resource.address}, #{resource.city} - #{resource.postal_code}"
  end

  def stringify_date(date)
    "#{I18n.l(date, format: '%d %B %Y, %Hh%M')}"
  end
end
