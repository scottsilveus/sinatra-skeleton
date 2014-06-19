require 'cgi'

helpers do
  # When inserting a string into a URL, special characters must be escaped
  # or the URL is invalid
  #
  def escape_string(str)
    CGI.escape(str)
  end

  def current_user
  	User.find_by_id(params[:user_id])
  end

end
