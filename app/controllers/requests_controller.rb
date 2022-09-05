class RequestsController < ApplicationController
    #load_and_authorize_resource
    before_action :set_request, only: %i[ show edit update destroy]

    def index
        @requests = Request.all 
    end



    def new
        @u_id = params[:format].to_i
        @request = Request.find_by(user_id: @u_id , patient_id: current_user.id)
        if @request.blank?
         Request.create(user_id: @u_id , patient_id: current_user.id , status: 'pending')
         else
                if @request.status == 'pending'
                        @request.delete
                else
                    Request.create(user_id: @u_id , patient_id: current_user.id , status: 'pending')
                end
        end
        redirect_to users_path
    end

    def edit
        @id = params[:id]
        @request = Request.find(@id)
        @request.update(status: 'accepted')
        redirect_to requests_path
    end


    def destroy
         @id = params[:id]
         @request = Request.find(@id)
         @request.update(status: 'rejected')
        redirect_to requests_path
    end



    private

    def set_request
      @request = Request.find(params[:id])
    end
    def hospital_params
      params.require(:request).permit(:status , :user_id , :patient_id)  
    end
end
