class UsersController < ApplicationController
	before_action :find_the_box, only: :store_data

	def index
		generate_random_user
		@grid_data = fetch_data_for_grid
	end

	def fetch_data_for_grid
		users = User.includes(:boxes)
		arr = []
		users.each do |u|
			u.boxes.each do |b|
				hash = Hash.new
				hash.store("username", u.username)
				hash.store("color", b.color)
				val = b.points.strip.split(",")
				hash.store("row_index", val[0])
				hash.store("col_index", val[1])
				arr.push(hash)
			end

		end
		arr
	end


	def store_data
		data = params[:data].split(",")
		puts data
		po = "#{data[1]},#{data[2]}".strip

		puts session[:user_id]
		@current_user = User.where(id: session[:user_id]).first
		@current_user.boxes.build color: data[0], points: po
		@current_user.save


	end


 private

  
	def user_params
		 params.require(:user).permit(:username, 
      boxes_attributes: [:color, :points])

	end

	def find_the_box
		data = params[:data].split(",")
		puts data
		po = "#{data[1]},#{data[2]}".strip
		@current_box = Box.find_by_points(po)
		@current_box.delete unless @current_box.nil?

	end
end
