class WelcomeController < ApplicationController
require 'base64'

  def index
  end

  def numplate
  	
  	file_upload=get_params[:avatar].tempfile
  	shit =  Base64.strict_encode64(file_upload.read)

  	byebug
  	file = 'data:image/jpeg'+"\;"+'base64,'+ Base64.strict_encode64(file_upload.read)


   
	# change image to base64 filet type
	# file = Base64.strict_encode64()

	data = OcrSpace::FilePost.post('/parse/image', body: { apikey: ENV['OCR_KEY'], language: 'eng', isOverlayRequired: true, base64Image: file})    
	# Hunshen's code: This filters out the stuff we want
	parsed_text = data.parsed_response['ParsedResults'][0]["ParsedText"].gsub(/\r|\n/, "")
	# call the api 
  end

  private

  def get_params
  	params.permit(:avatar)
  end


end
