class PagesController < ApplicationController
  def home
	@logs = Log.all 
	@logs.sort_by { |i| i.date }
  end
end
