class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    helper_method :cleanCategoryTitle, :cleanItemTitle
    
    protect_from_forgery with: :exception
    include SessionsHelper

    #can be used in view
    def cleanCategoryTitle string
      string.strip.upcase
    end

    def cleanItemTitle string
      str_a = string.split(' ')
      title = ''
      str_a.each do |str|
        title.concat(" #{str.capitalize}")
      end
      return title
    end

    private
  
      # Confirms a logged-in user.
      def logged_in_user
        unless logged_in?
          store_location
          flash.now[:danger] = "Please log in."
          redirect_to login_url
        end
      end
  
  end
  