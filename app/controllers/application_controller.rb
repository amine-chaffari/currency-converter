# For the documentation check http://sinatrarb.com/intro.html
class ApplicationController < Sinatra::Base
	require 'money/bank/currencylayer_bank'
	mclb = Money::Bank::CurrencylayerBank.new
	mclb.access_key = 'e130a49fdcb94025fae5a5d7930ee5c2'
	mclb.update_rates

	Money.default_bank = mclb

	# This configuration part will inform the app where to search for the views and from where it will serve the static files
  	configure do
		set :public_folder, 'app/public'
		set :views, "app/views"
		

  	end

  	get '/' do
		   erb :index
		   
	  end

	
	
	post '/' do  # calculate the currency conversion , save it in database and pass te result to result.erb
		
		from=params[:from]
		to=params[:to]
		amount=(params[:amount].to_f)
		result=Money.new(amount*100, from).exchange_to(to).format
		@conversion=Conversion.new(from: from, to: to, amount: amount, result: result)
		@conversion.save
		redirect "/result/"+ result
		
		
		
	end

	get '/history' do  #gets all the conversions

		@conversions = Conversion.all
		erb :history 
	end

	get '/result/:conversion' do  #display the results
		
		erb :result , {:locals => {:result =>params[:conversion]}}
		
	end

	  
	

end