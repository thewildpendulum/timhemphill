window.App = 
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	init: ->
		blog = new @Views.EntryView

$(document).ready ->
	App.init()