App.Routers.PostRouter = Backbone.Router.extend
	routes:
		"blog": 	"blog"
		"post": 	"post"

	blog = ->
		view = new App.Views.BlogView

	post = ->
		view = new App.Views.PostView