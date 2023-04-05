require 'rulers'
require_relative '../my_table'

class QController < Rulers::Controller 
  def sql_index
    @rows = MyTable.all 
  end
end