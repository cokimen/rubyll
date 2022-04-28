class Api::V1::WalletController < ApplicationController
    def index
        @wallets = Wallet.all
        render json: @wallets
       end
      # GET  /wallet/:id
      def show
        @wallet = Wallet.find(params[:id])
        render json: @wallet
       end
      # POST /wallet
       def create
        @wallet = Wallet.new(wallet_params)
        puts "fajri"
        if @wallet.save
         render json: @wallet
        else
         render error: { error: 'Unable to create Wallet.' }, status: 400
        end 
       end
      # PUT /wallet/:id
      def update
        @wallet = Wallet.find(params[:id])
        if @wallet
         @wallet.update(wallet_params)
         render json: { message: 'Wallet successfully update. '}, status:200
        else
         render json: { error: 'Unable to update Wallet. '}, status:400
        end 
       end
      # DELETE /wallet/id
      def destroy
        @wallet = Wallet.find(params[:id])
        if @wallet
         @wallet.destroy
         render json: { message: 'Wallet successfully deleted. '}, status: 200
        else
         render json: { error: 'Unable to delete Wallet. '}, status: 400
        end
       end
      private
      def wallet_params
        params.require(:wallet).permit(:saldo, :netwallet, :User_id)
       end
end
