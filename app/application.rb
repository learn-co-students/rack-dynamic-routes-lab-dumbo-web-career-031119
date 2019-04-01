# binding.pry
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)

      searched = req.path.split('/').last
      results = @@items.find{|x|x.name == searched}

      if results == nil
        # binding.pry
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write results.price
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end