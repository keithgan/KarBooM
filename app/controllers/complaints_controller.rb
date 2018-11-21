class ComplaintsController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:create]


	def index
		@test= Test.all
	end

	def new
	@test= Test.new
	end

	def create
	 #PARAMS ARE RIGHT. JUST GET IT TO DISPLAY RIGHT 
		byebug
		test= Test.new(get_params)
		if test.save
			redirect_to root_path
		else
			render 'new'
		end
	end

private

def get_params
	params.permit(:lattitude,:longitude,:img,:comment,:avatar)
end
end
