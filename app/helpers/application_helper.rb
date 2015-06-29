module ApplicationHelper
  def error_messages_for(object)
    render 'errors/error_messages', object: object
  end
end
