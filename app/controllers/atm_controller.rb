class AtmController < ApplicationController
  def home
  	atmaction = params[:atmaction]
  	@balance = RailsATM::Application.config.balance
  	@message = ""

  	case atmaction
  	when 'withdraw'
  		#get the withdrawal amount and update the balance
  		@amount = params[:w_amount].to_f
  		if @balance >= @amount
  			@balance = @balance - @amount
  			@message = "Withdrawal complete. Thank you."
  		else
  			@message = "Haha you're broke!"
  		end

  	when 'deposit'
  		#get deposit amount and update the balance
  		@amount = params[:d_amount].to_f
  		@balance = @balance + @amount
  		@message = "Deposit complete. Thank you."

  	when 'balance'
  		#show the current balance in message
  		@message = "Your balance is: $#{@balance}."
  	end

  	RailsATM::Application.config.message = @message
  	RailsATM::Application.config.balance = @balance
  end
end
