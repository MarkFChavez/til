class StuffsController < ApplicationController
  def index
    @stuffs = Stuff.all.group_by { |s| s.created_at.beginning_of_day }.sort_by { |k, _| k }.reverse
  end
end
