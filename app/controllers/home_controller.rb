class HomeController < ApplicationController

  def top
    if user_signed_in?
      redirect_to "/money_m/index"
    end
  end
end
