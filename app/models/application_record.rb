class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # enumの値をi18nで取得するメソッド
  def enum_i18n(enum_name)
    return nil if self.send(enum_name).nil?
    I18n.t!("enums.#{self.model_name.i18n_key}.#{enum_name}.#{self.send(enum_name)}")
  end

  # enumの値（全てのkeyのハッシュ）をi18nの形の配列で返すメソッド
  # フォームのセレクトボックスで使えるように、[表示名（i18n）, key]の形にしている
  # send(enum_name.to_s.pluralize)で、enumの値を全て取得している
  def self.enum_i18n(enum_name)
    self.send(enum_name.to_s.pluralize).keys.map do |key|
      [I18n.t("enums.#{self.model_name.i18n_key}.#{enum_name}.#{key}"), key]
    end
  end
end
