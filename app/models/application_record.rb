class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # enumの値をi18nで取得するメソッド
  def enum_i18n(enum_name)
    return nil if self.send(enum_name).nil?
    I18n.t!("enums.#{self.model_name.i18n_key}.#{enum_name}.#{self.send(enum_name)}")
  end
end
