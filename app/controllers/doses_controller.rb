class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create, :destroy ]

  def new
    puts ">>>>>>>>>>>>>>>>>>>   new   <<<<<<<<<<<<<<<<<<<<<<<<<"
    @dose = Dose.new
  end

  def create
    puts ">>>>>>>>>>>>>>>>>>>   create   <<<<<<<<<<<<<<<<<<<<<<<<<"
    @dose = @cocktail.doses.build(dose_params)
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Doses was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
