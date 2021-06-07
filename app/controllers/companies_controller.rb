class CompaniesController < ApplicationController
  include PitchDeckSplitter
  include CompaniesHelper

  def index   
    @companies = Company.all.order(created_at: :desc)
  end   
    
  def new   
    @company = Company.new   
  end 
  
  def show
    @company = Company.find(params[:id])
    @pitch_deck_images = @company.pitch_deck_images.order(:id)
    @images_path = UPLOADS_PATH
  end 
    
  def create
    created = CompaniesControllerHandler.new(company_params).handle_create
    if !created
      return redirect_to new_company_path, notice: "Invalid company"  
    end
    redirect_to companies_path, notice: "New company created!"   
  end    
    
  private

  def company_params   
    params.require(:company).permit(:name, :description, :attachment)   
  end   
end
