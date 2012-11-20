App.Views.PostView = Backbone.View.extend
	el: $('#main')

	template: _.template """
		<h2> <%= post.title %> </h2>
		<p> <%- post.body %> </p>
		<span> <%= post.dateCreated %> </span>
		<span> <%= post.tags %> </span>
	"""

	initialize: (options) ->
		@post = options.post
		@render()

	render: ->
		@$el.html @template post: @post.toJSON()
		
		@