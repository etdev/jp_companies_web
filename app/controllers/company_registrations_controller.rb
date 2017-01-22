class CompanyRegistrationsController < ApplicationController
  def new
  end

  def create
    @company_registration = CompanyRegistrationForm
      .new(company_registration_params)
    if @company_registration.save
      redirect_to companies_path, notice: t(".messages.create_success")
    else
      render :new, notice: t(".messages.create_failure")
    end
  end

  private

  def company_registration_params
    params.require(:company_registration).permit(
      :name,
      :name_jp,
      :name_kana,
      :employees_count,
      :vorkers_id,
      :en_hyouban_id
    )
  end
end
