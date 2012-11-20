window.App = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	init: ->
		#Create event aggregator for use with main and sidebar views
		@eventAggregator = _.extend {}, Backbone.Events
		router = new @Routers.AppRouter
		Backbone.history.start()

$(document).ready ->
	App.init()