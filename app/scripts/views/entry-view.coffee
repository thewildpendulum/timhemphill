App.Views.EntryView = Backbone.View.extend
	el: $('#main')

	template: _.template """
		<h2> Entry </h2>
		<input id="title" placeholder="Title" />
		<div id="epiceditor"></div>
		<span id='save'>Save</span>
		<!-- <span id='select_preview'>Select Preview Text</span> -->
		<a href="#blog"> Back to blog </a>
	"""

	events:
		'click #save': 'save'
		# 'click #select_preview': 'selectPreview'

	initialize: (options) ->
		_.bindAll @

		@entry = options.entry

		#Load epiceditor script
		$('body').append '<script src="scripts/vendor/epiceditor.min.js"></script>'

		#Listen for tag click events in TagsView and add tags to entry
		App.eventAggregator.on 'tagsUpdated', @updateTags

		@render()

	render: ->
		@$el.html @template

		#Load editor
		@editor = new EpicEditor().load()

		#fill in fields if editing
		if @entry.get 'body' then @editor.importFile '', @entry.get 'body'
		if @entry.get 'title' then $('#title').val @entry.get 'title'
		if @entry.get('tags').length then for tag in @entry.get 'tags'
			$('#'+tag).trigger 'click'
		
		@

	save: ->
		@entry.set 'body', @editor.exportFile(null, 'html')
		@entry.set 'title', $('#title').val()
		@entry.set 'dateCreated', new Date()
		@entry.set 'id', @entry.dashify @entry.get 'title'

		console.log @entry.toJSON()

		# @entry.save()
		#clears editor buffer
		# @editor.importFile ''
		#reload posts in router

	updateTags: (activeTags) ->
		@entry.set 'tags', activeTags.pluck 'tags'

		# console.log @entry.get 'tags'

	# selectPreview: ->
	#  	@entry.set 'preview', window.getSelection() if window.getSelection
	# 	console.log @editor.getElement('editor').getSelection()
