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

  def exception
    raise "It's a bad one!"
  end

  def quote_1
    quote_1 = FileModel.find(1)
    @obj = quote_1
    render(:quote)
  end
end