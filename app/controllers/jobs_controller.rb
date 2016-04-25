require 'net/http'

class JobsController < ApplicationController
	def index
		url = URI.parse('http://192.168.99.100:8080/v1/groups/mygroup/jobs/1')
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  		http.request(req)
		}
		puts res.body
	end
end
