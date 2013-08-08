
# encoding: UTF-8

namespace :daas do
  desc "clear all"
  task :clear => :environment do
    Transcoding.delete_all
  end  
end



