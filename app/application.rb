class Application

	@@items = []

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)


		if req.path.match(/items/)
			itemName = req.path.split("/items/").last
			itemFromArray = @@items.find{|item| item.name == itemName}
			if itemFromArray.nil?
				resp.status = 400
				resp.write "Item not found"
			else
				resp.write itemFromArray.price
			end
		else
			resp.status = 404
			resp.write "Route not found"
		end
		resp.finish
	end


end