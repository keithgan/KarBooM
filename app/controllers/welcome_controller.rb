class WelcomeController < ApplicationController
require 'base64'

  def index
  end

  def numplate
  	
  	file_upload=get_params[:avatar].tempfile
  	# change image to base64 filet type with format  "data:image/jpeg;base64,#{@image}"
  	shit =  Base64.strict_encode64(file_upload.read)
  	file = 'data:image/jpeg'+"\;"+'base64,'+shit
  
	# call the api 
	data = OcrSpace::FilePost.post('/parse/image', body: { apikey: ENV['OCR_KEY'], language: 'eng', isOverlayRequired: true, base64Image: file})    
	# Hunshen's code: This filters out the stuff we want

	parsed_text = data.parsed_response['ParsedResults'][0]["ParsedText"].gsub(/\r|\n/, "")
	byebug

	if parsed_text.length == nil || parsed_text.length == 0

		#column is empty 
	else
		# display the number plate
	end



  end

  private

  def get_params
  	params.permit(:avatar)
  end


end
