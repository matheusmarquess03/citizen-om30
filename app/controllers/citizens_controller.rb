class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[ show edit update destroy ]

  # GET /citizens or /citizens.json
  def index
    return @citizens = Citizen.search(params[:query], match: :word_middle).results if params[:query]
    @citizens = Citizen.all
  end

  # GET /citizens/1 or /citizens/1.json
  def show
  end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  # GET /citizens/1/edit
  def edit
  end

  # POST /citizens or /citizens.json
  def create
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        flash.now[:notice] = 'Citizen was created.'
        format.html { redirect_to @citizen, notice: notice }
        format.json { render :show, status: :created, location: @citizen }
        format.js { redirect_to citizens_path, notice: notice}
      else
        flash.now[:alert] = "Citizen was not created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
        format.js { render :new, location: @citizen }
      end
    end
  end

  # PATCH/PUT /citizens/1 or /citizens/1.json
  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        flash.now[:notice] = "Citizen was updated."
        format.html { redirect_to @citizen, notice: notice }
        format.json { render :show, status: :ok, location: @citizen }
        format.js { render :show }
      else
        flash.now[:alert] = "Citizen was not updated."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def search_form
    render 'citizens/search/show'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_citizen
    @citizen = Citizen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def citizen_params
    params.require(:citizen).permit(:full_name, :cpf, :email, :birthdate, :phone, :status, :photo,
                                    address_attributes: [:id, :zipcode, :public_place, :number, :complement, :neighborhood, :city, :state, :ibge_code])
  end
end