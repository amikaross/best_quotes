require 'rulers'

class QuotesController < Rulers::Controller 
  def a_quote 
    @thing = "thing"
    @stuff = "stuff"
    @noun = "blinkING"
    render(:a_quote)
  end

  def exception
    raise "It's a bad one!"
  end
end