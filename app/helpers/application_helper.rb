module ApplicationHelper
  def flash_message
    flash.map do |type , message|
      message_div(type , message)
    end.join.html_safe
  end

  private

  def message_div(type , message)
    content_tag :div, class: 'message ' + type.to_s do
      content_tag :p do
        message
      end
    end
  end
end
