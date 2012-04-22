(($) ->
    # Overwrite bonzo's removal methods to fire an event on removal, and also unbind event handlers
    {empty, remove, replaceWith} = $('')

    triggerRemoveEvent = (els) ->
        els.deepEach (el) ->
            $(el).trigger('remove').unbind()
            return

        return

    $.ender({
        empty: () ->
            triggerRemoveEvent(this.children())
            return empty.apply(this, arguments)

        remove: () ->
            triggerRemoveEvent(this)
            return remove.apply(this, arguments)
    
        replaceWith: () ->
            triggerRemoveEvent(this)
            return replaceWith.apply(this, arguments)
    
    }, true)

)(ender)