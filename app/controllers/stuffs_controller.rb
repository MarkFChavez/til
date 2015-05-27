class StuffsController < ApplicationController
  def index
    @stuffs = Stuff.all
  end
end
