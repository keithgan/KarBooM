class WelcomeController < ApplicationController
require 'base64'
skip_before_action :verify_authenticity_token, :only => [:numplate]


  def index
  end

  def numplate
  	byebug
  	@users = User.all

  	file_upload=get_params[:avatar].tempfile
  	# change image to base64 filet type with format  "data:image/jpeg;base64,#{@image}"
  	shit =  Base64.strict_encode64(file_upload.read)
  	file = 'data:image/jpeg'+"\;"+'base64,'+shit
  
	# call the api 
	data = OcrSpace::FilePost.post('/parse/image', body: { apikey: ENV['OCR_KEY'], language: 'eng', isOverlayRequired: true, base64Image: file})    
	# Hunshen's code: This filters out the stuff we want

	# .strip gets rid of whitespace before and after the text
	@parsed_text = data.parsed_response['ParsedResults'][0]["ParsedText"].gsub(/\r|\n/, "").strip
	
	# Respond
	if @parsed_text.length == nil || @parsed_text.length == 0
		@parsed_text = "Number plate cant be detected. Please try again"
		render status: 200, json: @parsed_text.to_json
	else
		 array = []
		if User.find_by(number_plate:@parsed_text)
			user = User.find_by(number_plate:@parsed_text)
			array.push(@parsed_text)
			array.push(user.full_name)
			array.push(user.driving_license)
			array.push(user.email)
			array.push(user.fines.length)

			render status: 200, json: array.to_json
		else

			render status: 200, json: @parsed_text.to_json
		end

		
	end

  end

  private

  def get_params
  	params.permit(:avatar)
  end


end
