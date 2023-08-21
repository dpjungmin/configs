(fn is-ready? [feats execs]
  (var ok true)
  (each [_ f (ipairs feats)]
    (if (not= 1 (vim.fn.has f))
        (vim.notify (.. "Feature " f " is required, but is missing!")
                    (set ok false))))
  (each [_ e (ipairs execs)]
    (if (not= 1 (vim.fn.executable e))
        (vim.notify (.. "Executable " e " is required, but is missing!")
                    (set ok false))))
  ok)

(fn load-mods [mods]
  (each [_ mod (ipairs mods)]
    (require mod)))

(fn main [args]
  (if (not (is-ready? args.feats args.execs))
      (vim.cmd :finish))
  (load-mods [:autocmds :globals :mappings :options]))

(main {:feats [:nvim-0.9.1 :python3] :execs [:git :rg :fd]})
