class Site < ActiveRecord::Migration
  def self.up
    Spree::Config.set(:default_country_id => 97) 
  end

  def self.down
  end
end
