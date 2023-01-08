require('Comment').setup()

require('todo-comments').setup({
  keywords = {
    FIX = { icon = " ", color = "error" },
    TODO = { icon = " ", color = "info" }
  },
  merge_keywords = false
})

