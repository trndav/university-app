class CoursesController < ApplicationController

    # Skip before_action defined in application_controller
    skip_before_action :require_user

    def index
        @courses = Course.all
    end

    def new
    end
end