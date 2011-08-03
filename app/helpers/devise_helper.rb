module DeviseHelper
  # Overriding the way Devise displays error messages
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, html_escape(msg)) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

flash[:error] = "<ul>#{messages}</ul>".html_safe

#    html = <<-HTML
 #   <div id="error_explanation">
  #    <h2>#{sentence}</h2>
   #   <ul>#{messages}</ul>
#    </div>
 #   HTML

  #  html.html_safe
  end
end