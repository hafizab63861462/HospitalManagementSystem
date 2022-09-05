class HospitalsController < ApplicationController
    load_and_authorize_resource
    before_action :set_hospital, only: %i[ show edit update destroy]


    def index
        @hospitals = Hospital.all 
    end


    def show
    end


    def new
        @hospital = Hospital.new
    end


    def create
        @hospital = Hospital.new(hospital_params)
        if @hospital.save
            redirect_to hospitals_path , notice => "Your Hospital create successfully"
        else
            render "new"
        end
    end


    def edit
    end


    def update
         if @hospital.update_attributes(hospital_params)
          redirect_to hospitals_path , notice => "Your Hospital was Update"
        else
            render "edit"
        end
    end


    def destroy
         @hospital.destroy
        redirect_to hospitals_path , notice => "Your Hospital was Deleted"
    end



    private
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end
    def hospital_params
      params.require(:hospital).permit(:name , :city , :address)  
    end
end
