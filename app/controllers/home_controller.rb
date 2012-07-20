class HomeController < ApplicationController
  skip_before_filter :authorize

  def index
    @quote = Quote.order('entered DESC').first
  end
end
