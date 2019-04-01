# require 'pry'
class Application
    @@items=[]
  def call(env)

      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        arr = []
        item_name = req.path.split("/items/").last
        @@items.each do |item|
          arr << item.name
        end
        if arr.include?(item_name)
          @@items.find do |item| item.name == item_name
          resp.write item.price
        end
      else
          resp.status = 400
          resp.write"Item not found"
        end
      else
        resp.status = 404
        resp.write"Route not found"
      end
      resp.finish
    end


  end
