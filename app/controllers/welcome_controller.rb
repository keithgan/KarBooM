class WelcomeController < ApplicationController


  def index
  end

  def numplate
  	
  
	url = URI.parse('https://platerecognizer.com/plate-reader/')
	path =  complaint.avatar.current_path
	
	File.open(path) do |jpg|
	
	  req = Net::HTTP::Post::Multipart.new url.path,
	    "upload" => UploadIO.new(jpg, "image/jpeg", path)
	  req['Authorization'] = '640a016c82e33e4f0268b1e7d55ba9664717b68d '
	  res = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
	    http.request(req)
	  end
	end
  end

  private

  def get_params
  	params.permit(avatar:{})
  end


end
