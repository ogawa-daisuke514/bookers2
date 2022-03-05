class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_form_title_class(prop_name)
    errors[prop_name].any? ? "text-danger" : "text-dark"
  end

  def get_form_class(prop_name)
    errors[prop_name].any? ? "form-control is-invalid" : "form-control"
  end
end
