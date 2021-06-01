class PetsController < ApplicationController
  # As a user I want to see a list of all the "Happy" animals rescued
  before_action :set_pet, only: [:show, :edit, :destroy, :update]
  def index
    @pets = Pet.all
  end

  # See details of a specific animal
  def show
  end

  def new
    @pet = Pet.new
  end

  # I want to add a new pet

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pets_path
      flash[:alert] = "Pet Saved"
    else
      render :new
    end
  end

  # I want to update my pet listing
  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  # I want to delete my pet listing
  def destroy
    if @pet.destroy
      redirect_to pets_path
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :address, :found_on)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
