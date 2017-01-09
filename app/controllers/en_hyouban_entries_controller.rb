class EnHyoubanEntriesController < ApplicationController
  def show
    @entry = EnHyoubanEntry.find(params[:id])
  end

  def index
    @entries = EnHyoubanEntry.all
      .by_highest_salary
      .page(params[:page])
  end
end
