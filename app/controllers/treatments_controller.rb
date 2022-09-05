class TreatmentsController < ApplicationController
    load_and_authorize_resource
    before_action :set_hospital , only: %i[ index show new create edit update destroy assignHospitalAndTreatmentToDoctor]
    before_action :set_treatment, only: %i[ show edit update destroy ]

    def index
    
          @treatments = @hospital.treatments 
    end


    def show
    end


    def new
        @treatment = @hospital.treatments.new
    end


    def create
         @treatment = @hospital.treatments.create(treatment_params)
    
        if @treatment.save
            redirect_to hospital_treatments_path , notice => "Your Treatment create successfully"
        else
            render "new"
        end
    end


    def edit
    end


    def update
         if @treatment.update(treatment_params)
                redirect_to hospital_treatments_path
            else
                render "new"
            end
    end


    def destroy
        @treatment.destroy
         redirect_to hospital_treatments_path, notice: "Treatment was successfully destroyed." 
    end

    def assignHospitalAndTreatmentToDoctor
        h_id = params[:hospital_id].to_i
        t_id = params[:id].to_i
        u_id = params[:uid].to_i

        @user = User.find(u_id)
        @hospital_treatment = HospitalTreatment.find_by(hospital_id: h_id , treatment_id: t_id)
        if @user.hospital_treatments_id == nil
            @user.update(hospital_treatments_id: @hospital_treatment.id)
        else
            @user.update(hospital_treatments_id: nil)
        end
        redirect_to hospital_treatment_path
    end


    private
    def set_hospital
      @hospital = Hospital.find(params[:hospital_id])
    end
    def set_treatment
      @treatment = @hospital.treatments.find(params[:id])
    end
    def treatment_params
    params.require(:treatment).permit(:name , :price)  
      
    end

end
