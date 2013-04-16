class PagesController < ApplicationController
  def home
	@logs = Log.all 
	@logs_sorted = @logs.sort_by &:date
  end
end
