class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
    puts ">>>>>>>>>>>>>>>>>>>>>>    NEW    <<<<<<<<<<<<<<<<<<"
    p @dose
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    @dose.save
    puts ">>>>>>>>>>>>>>>>>>>>>>    criando    <<<<<<<<<<<<<<<<<<"
    p @dose

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Doses was successfully destroyed.' }
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :name, :cocktail_id, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
