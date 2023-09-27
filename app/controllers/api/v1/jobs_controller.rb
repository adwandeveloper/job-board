module Api
  module V1
    class JobsController < ApplicationController

      before_action :authenticate_user
      before_action :is_admin, only: [ :create, :update, :destroy]
      before_action :set_job, only: [:show, :update, :destroy]


      def index
        @jobs = Job.all
        render_json(@jobs)
      end

      def show
        render_json(@job)
      end

      def create
        @job = Job.new(job_param)
        @job.user_id = @current_user.id
        if @job.save
          render_json(@job, :created)
        else
          render_json({ errors: @job.errors.full_messages }, :unprocessable_entity)
        end
      end

      def update
        @job.update(job_param)
        render_json(@job)
      end

      def destroy
        @job.destroy
        render_json(@job)
      end

      private

      def job_param
        @params = params.require(:job).permit(:title, :description)
      end

      def set_job
        @job = Job.find_by("id": params[:id])
        unless @job
          render_json({ error: 'Job not found' }, :not_found)
        end
      end
    end
  end
end