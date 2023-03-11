class ReceiptsController < ApplicationController
    def new
        @menu = Menu.find(params[:menu_id])
        @receipt = Receipt.new
    end

    def create
        @receipt = Receipt.new(receipt_params)
        @menu = Menu.find(params[:menu_id])
        @receipt.menu = @menu
        @receipt.save
        #redirect_to menu_path(@menu), notice: 'receipt created'

    end

    def edit
        @menu = Menu.find(params[:menu_id])
    end

    def print
        @menu = Menu.find(params[:id])
        respond_to do |format|
          format.text do
            render plain: @menu.receipt.content.gsub(/\n/, "\r\n")
          end
        end
      end


    private

    def receipt_params 
        params.require(:receipt).permit(:content)
    end
end
