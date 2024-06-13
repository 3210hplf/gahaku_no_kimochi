require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # 本番環境と開発環境で保存先を変更
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'kahakunobucket' # 作成したバケット名
    # config.cache_storage = :fog
    # config.fog_public = false
    # config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/バケット名"
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], # 環境変数
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # 環境変数
      region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
      path_style: true
    }
  else
    config.storage = :file
    # config.cache_storage = :file
    config.enable_processing = Rails.env.development?
  end
end