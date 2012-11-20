App.Views.TagsView = Backbone.View.extend
	el: $('#sidebar')

	template: _.template """
		<h2> Tags </h2>
		<ul>
			<% _.each(tags, function(tag) { %>
				<li class="tag" id="<%= tag.name %>"> <%= tag.name %> </li>
			<% }); %>
		</ul>
	"""

	events:
		'click .tag': 'updateTags'

	initialize: (options) ->
		_.bindAll @
		
		@tags = options.tags

		#Keep track of tag clicks
		@activeTags = new App.Collections.Tags
		@activeTags.bind 'add remove', @notify

		@render()

	render: ->
		@$el.html @template tags: @tags.toJSON()

		@

	updateTags: (e) ->
		tag = @tags.findOne name: e.srcElement.id

		if @activeTags.has tag
			@activeTags.remove tag
		else
			@activeTags.add tag

	notify: ->
		console.log @activeTags
		App.eventAggregator.trigger 'tagsUpdated', @activeTags
