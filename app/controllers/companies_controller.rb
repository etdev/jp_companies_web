class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all.by_rating
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
      .permit(:name, :name_jp, :name_kana, :main_image_url)
  end
end
