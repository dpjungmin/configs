# Query invalid structure at position X for language lua...

You should only see one `lua.so` file when running this command:

```vim
:echo nvim_get_runtime_file('*/lua.so', v:true)
```

If you see two or more, remove all except the one installed by treesitter.
