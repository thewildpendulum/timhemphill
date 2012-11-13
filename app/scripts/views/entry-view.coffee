App.Views.EntryView = Backbone.View.extend
	el: $('#view')

	template: _.template """
		<div id="epiceditor"></div>
		<div id="entry_tags" class="entry_tags">
			<ul>
				<% _.each(tags, function(tag) { %>
					<li> <%= tag.name %> </li>
				<% }); %>
			</ul>
		</div>
	"""

	initialize: ->
		#Load epiceditor script
		$('body').append '<script src="scripts/vendor/epiceditor.min.js"></script>'
		#Create new post object for new blog entry
		@post = new App.Models.Post
		#Get tags to add to entry
		@tags = new App.Collections.Tags [{name: 'me'}, {name: 'this stuff'}, {name: 'that stuff'}]

		@render()

	render: ->
		@$el.append 'entry view'
		@$el.append @template tags: @tags.toJSON()
		#Load editor
		@editor = new EpicEditor().load()
		@