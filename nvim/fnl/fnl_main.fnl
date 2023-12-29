(fn load-mods [mods]
  (each [_ mod (ipairs mods)]
    (require mod)))

(fn main []
  (load-mods [:mappings]))

(main)
