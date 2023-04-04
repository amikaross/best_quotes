require 'rulers'

class QuotesController < Rulers::Controller 
  def index 
    @quotes = FileModel.all 
  end

  def show 
    @obj = FileModel.find(params["id"])
    @ua = request.user_agent
    render_response(:quote)
  end

  def a_quote 
    @thing = "thing"
    @stuff = "stuff"
    @noun = "blinkING"
  end

  def new_quote
    attrs = {
      "submitter" => "web_user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    @obj = FileModel.create(attrs)
    render_response(:quote)
  end

  def update
    raise "Only POST to this route!" unless @env["REQUEST_METHOD"] == "POST"

    body = env["rack.input"].read
    astr = body.split("&")
    params = {}
    astr.each do |a|
      name, val = a.split("=")
      params[name] = val
    end
    quote = FileModel.find(params["id"].to_i)
    quote["submitter"] = params["submitter"]
    quote.save
    @obj = quote 
    render_response(:quote)
  end

  def exception
    raise "It's a bad one!"
  end

  def quotes_by_submitter
    submitter = File.split(env["PATH_INFO"])[-1].gsub("%20", " ")
    @quotes = FileModel.find_all_by_submitter(submitter)
    render_response(:index)
  end
end