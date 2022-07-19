class HomesController < ApplicationController
  def top
    @ramens = Ramen.all
  end

  def about
  end
end
