class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def create
    @record = Record.new record_params
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    head :no_content
  end
  
  def update
     @record = Record.find(params[:id])
     if @record.update(record_params)
       render json: @record
     else
       render json: @record.errors, status: :unprocessable_entity
     end
   end
  private
    def record_params
      params.require(:record).permit(:date, :title, :amount)
    end
end