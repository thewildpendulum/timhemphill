App.Views.BlogView = Backbone.View.extend
    el: $('#main')

    template: _.template """
        <h2> Blog </h2>
        <% _.each(posts, function(post) { %>
            <div class="post" id="<%= post.name %>">
                <h3> <%= post.title %> </h3>
                <p> <%= post.body %> </p>
                <p> <a href="/blog/<%= post.name %>"> Read more... </a> </p>
                Posted: <span> <%= post.dateCreated %> </span>
                Tags: <span> <%= post.tags.join(', ') %> </span>
                <a href="/admin/edit/<%= post.name %>"> Edit </a>
            </div>
        <% }); %>
        <a href="/admin/new"> New </a>
    """

    initialize: (options) ->
        _.bindAll @

        @posts = options.posts
        @filterTags = []

        #Load pagination script
        $('body').append """
            <script src="scripts/vendor/backbone.paginator.min.js"></script>
        """

        #Listen for tag click events in TagsView and filter posts
        App.eventAggregator.on 'tagsUpdated', @filterPosts

        @render()

    render: ->
        @$el.html @template posts: @posts.filterByTags @filterTags

        @

    filterPosts: (activeTags) ->
        @filterTags = activeTags.pluck 'name'
        @render()
