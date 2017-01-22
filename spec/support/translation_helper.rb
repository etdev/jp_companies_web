module TranslationHelper
  def t(*args)
    I18n.t(*args)
  end

  # shorter method to get translation of AR model attribute
  def t_attr(model, attr)
    model.to_s
      .classify
      .constantize
      .human_attribute_name(attr)
  end
end
