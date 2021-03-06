class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
      .enabled
      .by_rating
      .includes(:en_hyouban_entry, :vorkers_entry)
      .page(params[:page])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  private

  def company_params
    params
      .require(:company)
      .permit(
        :name,
        :name_jp,
        :name_kana,
        :main_image_url,
        :custom_categories,
        :is_enabled,
        :is_hiring,
        :japanese_level,
        :main_location
      )
  end
end
