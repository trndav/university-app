class ApplicationController < ActionController::Base 
    
    # all Application controllers will require this method first
    before_action :require_user

    # this code identifies named methods as helper, makes them available for views also
    helper_method :current_user, :logged_in?
    
    def current_user
        if session[:student_id].present?
            # || prevent query hitting database if object is already present
            @current_user ||= Student.find_by(id: session[:student_id])
          end        
    end
    
    def logged_in?
        # !! turns into a bool true/false
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:notice] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
