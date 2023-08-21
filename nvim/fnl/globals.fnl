(import-macros {: set!} :macros)

(var g vim.g)

; Global settings
(set g.vimsyn_embed :lP)

; Globals variables
(set g.backupdir (vim.fn.expand (.. (vim.fn.stdpath :data) :/backup//)))
(set g.is_mac (= 1 (vim.fn.has :macunix)))
(set g.is_linux (and (vim.fn.has :unix) (not (vim.fn.has :macunix))))
(set g.sessiondir (.. (vim.fn.stdpath :data) :/sessions))

; Global functions
(global P (fn [x]
            (print (vim.inspect x))
            x))
(set _G.dp {})
(set _G.dp.resume-last-cursor-pos
  (fn []
    (vim.cmd "
      let ok = v:true

      if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line('$') && &ft !~# 'commit'
        let args = v:argv  \" command line arguments

        for arg in args
          if match(arg, '\\v^\\+(\\d){1,}$') != -1
            ok = false
            break
          endif
        endfor

        if ok
          execute \"normal! g`\\\"zvzz\"
        endif
      endif")))

; Create session directory
(vim.fn.mkdir g.sessiondir :p)
