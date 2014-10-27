#AWS configuration with carrierwave
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",                        # required
    :aws_access_key_id      => ENV["AKIAJXLBWTLWLMYLRAFQ"],                        # required
    :aws_secret_access_key  => ENV["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"],                       # required
  }
  config.fog_directory  = ENV["stuternbeta"]                          # required
end