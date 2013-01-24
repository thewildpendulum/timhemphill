App.Views.ActionsView = Backbone.View.extend
    el: $('#sidebar')

    template: _.template """
        <h2> Actions </h2>
        <ul>
            <li> <a href="/blog/<%= postName %>"> Permalink </a> </li>
            <li> twitter </li>
            <li> github </li>
            <li> linkedin </li>
            <li> <a href="/blog"> Back </a> </li>
        </ul>
    """

    initialize: (options) ->
        @postName = options.postName

        @render()

    render: ->
        @$el.html @template postName: @postName

        @
