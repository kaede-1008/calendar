# Rackのrackupコマンドを使ってサーバ起動を行うための設定ファイル
# gemの読み込みやDBの設定ファイルの読み込みなどを記述
# RackとはHTTP送受信処理を担当するモジュール

require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra/reloader'
require './app.rb'


require './app.rb'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |f| require f }
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each { |f| require f }


# database.ymlを読み込む
ActiveRecord::Base.configurations = YAML.load_file('database.yml')

# developmentを設定
ActiveRecord::Base.establish_connection(:development)

Time.zone = 'Tokyo'
ActiveRecord::Base.default_timezone = :local

run Sinatra::Application