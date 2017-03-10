HighVoltage.configure do |config|
  config.home_page = 'home' # Make the root page to the home page
  config.route_drawer = HighVoltage::RouteDrawers::Root # Take pages extension off
end
