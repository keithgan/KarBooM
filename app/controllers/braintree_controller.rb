class BraintreeController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
    @fine = Fine.find(params[:id])
  end

  def checkout
    @fine = Fine.find(params[:id])
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
  
    result = Braintree::Transaction.sale(
     :amount => @fine.amount, #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )
  
    if result.success?
      redirect_to :root, :flash => { :success => "Transaction successful!" }
      @fine.status = 1
      @fine.save
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
