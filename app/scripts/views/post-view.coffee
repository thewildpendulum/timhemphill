App.Views.PostView = Backbone.View.extend
	el: $('#view')

	template: _.template """
		<h2> <%= post.title %> </h2>
		<p> <%= post.body %> </p>
		<span> <%= post.dateCreated %> </span>
		<span> <%= post.tags %> </span>

		<ul>
			<li> <a href=""> Permalink </a> </li>
			<li> twitter </li>
			<li> github </li>
			<li> linkedin </li>
			<li> <a href="localhost:3501"> Back </a> </li>
		</ul>
	"""

	initialize: ->
		@post = new App.Models.Post { 
						name: "post-1",
						title: "post 1",
						body: "this is my first blog post. woo!",
						preview: "this is my first",
						tags: ["me", "this stuff"],
						dateCreated: "11/3/2012 4:37PM"
					}
		@render()

	render: ->
		@$el.append 'post view'
		@$el.append @template {post: @post.toJSON() }
		@