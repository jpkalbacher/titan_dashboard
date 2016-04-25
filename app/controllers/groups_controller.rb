require 'net/http'

class GroupsController < ApplicationController
	def index
		url = URI.parse('http://192.168.99.100:8080/v1/groups')
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  		http.request(req)
		}

		@groups = JSON.parse(res.body)["groups"]
	end

	def show
		url = URI.parse("http://192.168.99.100:8080/v1/groups/#{params[:name]}")
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
  		http.request(req)
		}
		@group = JSON.parse(res.body)["group"]
	end

	private
	def group_params
		params.require(:group).permit(:name, :id, :created_at)
	end
end
