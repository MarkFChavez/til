class StuffsController < ApplicationController
  def index
    @stuffs = Stuff.all.group_by { |s| s.created_at.beginning_of_day }.reverse
  end
end
