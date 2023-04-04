require 'rulers'

class QuotesController < Rulers::Controller 
  def index 
    @quotes = FileModel.all 

    render(:index)
  end

  def a_quote 
    @thing = "thing"
    @stuff = "stuff"
    @noun = "blinkING"
    render(:a_quote)
  end

  def new_quote
    attrs = {
      "submitter" => "web_user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    @obj = FileModel.create(attrs)
    render(:quote)
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
    render(:quote)
  end

  def exception
    raise "It's a bad one!"
  end

  def quote_1
    quote_1 = FileModel.find(1)
    @obj = quote_1
    render(:quote)
  end

  def quotes_by_submitter
    submitter = File.split(env["PATH_INFO"])[-1].gsub("%20", " ")
    @quotes = FileModel.find_all_by_submitter(submitter)
    render(:index)
  end
end