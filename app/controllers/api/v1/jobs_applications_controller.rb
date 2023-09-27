module Api
  module V1
    class JobsApplicationsController < ApplicationController

      before_action :authenticate_user
      before_action :is_admin, only: [:index, :show]
      before_action :is_seeker, only: [:create, :destroy, :my_applications]
      before_action :set_job_application, only: [:show, :destroy]

      def index
        @applications = JobApplication.all
        render_json(@applications)
      end

      def show
        if @application.seen == false
          @application.seen = true
          @application.save
        end
        render_json(@application)
      end

      def create
        @application = JobApplication.new(job_application_param)
        @application.user_id = @current_user.id
        if @application.save
          render_json(@application, :created)
        else
          render_json({ errors: @application.errors.full_messages }, :unprocessable_entity)
        end
      end

      def destroy
        @application.destroy
        render_json(@application)
      end

      def my_applications
        @my_applications = JobApplication.where("user_id": @current_user.id)
        render_json(@my_applications)
      end

      private

      def job_application_param
        params.require(:jobs_application).permit(:job_id)
      end

      def set_job_application
        @application = JobApplication.find_by("id": params[:id])
        unless @application
          render_json({ error: 'Job Application not found' }, :not_found)
        end
      end

    end
  end
end