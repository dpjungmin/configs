(import-macros {: set!} :macros)

(fn load [x]
  (when vim.g.colors_name
    (if (= x vim.g.colors_name)
      (lua :return)
      (vim.cmd "hi clear")))
  (when (vim.fn.exists :syntax_on)
    (vim.cmd "syntax reset"))
  (set vim.g.colors_name x)
  (set! termguicolors)
  (require (.. :colors "." x)))

{: load}
