App.Views.EntryView = Backbone.View.extend
	el: $('#view')

	template: _.template """
		<input id="title" placeholder="Title" />
		<div id="epiceditor"></div>
		<span id='save'>Save</span>
		<!-- <span id='select_preview'>Select Preview Text</span> -->
		<div id="entry_tags" class="entry_tags">
			<ul>
				<% _.each(tags, function(tag) { %>
					<li class="tag" id="<%= tag.name %>"> <%= tag.name %> </li>
				<% }); %>
			</ul>
		</div>
	"""

	initialize: ->
		#Load epiceditor script
		$('body').append '<script src="scripts/vendor/epiceditor.min.js"></script>'
		#Create new post object for new blog entry
		@post = new App.Models.Post()
		#Get tags to add to entry
		@tags = new App.Collections.Tags [{name: 'me'}, {name: 'this stuff'}, {name: 'that stuff'}]

		@render()

	render: ->
		@$el.append 'entry view'
		@$el.append @template tags: @tags.toJSON()
		#Load editor
		@editor = new EpicEditor().load()
		@

	save: ->
		@post.set 'body', @editor.exportFile()
		@post.set 'title', $('#title').val()
		@post.set 'dateCreated', new Date()
		@post.set 'name', @post.dashify @post.get 'title'

		console.log @post.toJSON()

		#@post.save()
		#@editor.clear()

	includeTag: (e) ->
		tag = e.srcElement.id
		if tag in @post.get 'tags'
			@post.remove 'tags', tag
		else
			@post.push 'tags', tag

		console.log @post.get 'tags'

	# selectPreview: ->
	# 	@post.set 'preview', window.getSelection() if window.getSelection
	# 	console.log window.getSelection()

	events:
		'click #save': 'save'
		'click .tag': 'includeTag'
		# 'click #select_preview': 'selectPreview'
