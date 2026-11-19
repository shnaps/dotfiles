# nvim

Standalone Neovim config. It uses built-in Neovim features where they cover the job and plugins for the rest.

## Requirements

- **Neovim 0.12+**: `vim.pack`, ui2, `'autocomplete'`, `:Undotree`
- `git`, a C compiler and the `tree-sitter` CLI for nvim-treesitter (`main` branch)
- A Nerd Font for icons
- `ripgrep` and `fzf` for fzf-lua
- Windows only: run `git config --global core.longpaths true`. fzf-lua's test files exceed the default path limit.

## Layout

```
nvim/
├── init.lua                 -- version check, vim.loader, ui2, then config + plugins
└── lua/
    ├── config/              -- built-in features, no plugins
    │   ├── options.lua      -- vim.opt settings, indent guides, exrc
    │   ├── autocmds.lua     -- autocommands
    │   ├── keymaps.lua      -- non-plugin keymaps, quickfix/loclist maps
    │   ├── lsp.lua          -- diagnostics, server overrides, LspAttach maps, reference highlight
    │   ├── completion.lua   -- built-in autocomplete + LSP completion
    │   └── utils.lua        -- helper functions
    └── plugins/
        ├── init.lua         -- vim.pack.add() list + build hooks
        ├── colorscheme.lua  -- tokyonight
        ├── ui.lua           -- lualine, nvim-highlight-colors, which-key
        ├── editor.lua       -- autopairs, zen-mode, hardtime, precognition, snacks, :Undotree
        ├── fzf.lua          -- fzf-lua
        ├── treesitter.lua   -- nvim-treesitter + textobjects (main branch)
        ├── formatting.lua   -- conform.nvim
        ├── lsp.lua          -- mason, mason-lspconfig, nvim-java
        ├── git.lua          -- gitsigns, neogit (+ diffview)
        ├── dap.lua          -- nvim-dap, dap-ui, dap-virtual-text, mason-nvim-dap
        └── typst.lua        -- typst-preview
```

## Built-in features that replaced plugins

| Plugin | Replaced by |
|---|---|
| lazy.nvim | `vim.pack` (plugin list in `lua/plugins/init.lua`) |
| blink.cmp, friendly-snippets | `'autocomplete'` + `vim.lsp.completion` (`config/completion.lua`) |
| noice.nvim, nvim-notify, nui (as noice dependency) | ui2: `require("vim._core.ui2").enable()` |
| dressing.nvim (archived) | built-in `vim.ui.input` / `vim.ui.select` |
| indent-blankline.nvim | `'listchars'` `leadmultispace`, resized per buffer `'shiftwidth'` |
| vim-illuminate | `vim.lsp.buf.document_highlight` on `CursorHold` |
| undotree (mbbill) | `:packadd nvim.undotree` + `:Undotree` |
| trouble.nvim | quickfix and location lists (`<leader>q*`) |
| neoconf.nvim | `'exrc'`: put project settings in `.nvim.lua` |
| typescript-tools.nvim | `vtsls` through `vim.lsp.enable` (installed by Mason) |

## Plugins

- **Update:** run `:lua vim.pack.update()`, review the diff buffer, then `:write` to apply. The dashboard key `u` runs it too.
- **Remove:** delete the entry from `lua/plugins/init.lua`, then run `:lua vim.pack.del({ "name" })`.
- `nvim-pack-lock.json` records the installed versions. `.chezmoiignore` keeps it out of the repo.

## Completion

- In LSP buffers, LSP results appear as you type. In other buffers, words from open buffers appear.
- `<Tab>` / `<S-Tab>` move through the menu or jump between snippet fields.
- `<CR>` accepts the selected item. With nothing selected it inserts a newline (through nvim-autopairs).
- `<C-Space>` opens LSP completion by hand. `<C-s>` in insert mode shows signature help (Neovim default).

## Keymaps

Leader is `<space>`. Run `<leader>ch` (cheatsheet) or `<leader>?` (buffer-local) for the full list. NvChad muscle-memory shortcuts are kept. Highlights:

- `<leader>ff` — find files
- `<leader>fa` — find all files (hidden)
- `<leader>fw` — live grep
- `<leader>fb` — find buffers
- `<leader>fo` — recent files
- `<leader>fz` — fuzzy search current buffer
- `<leader>e` / `<C-n>` — file explorer
- `<leader>ch` — cheatsheet
- `<leader>?` — buffer-local keymaps
- `<leader>n` / `<leader>rn` — toggle line numbers / relative
- `<leader>/` — toggle comment
- `<leader>fm` / `<leader>cf` — format buffer
- `<leader>gn` — neogit
- `<leader>gb` — git blame line
- `<leader>gh` / `<leader>gd` — message history / clear messages
- `<leader>gg` — open GitHub link from string under cursor
- `<leader>ph` / `<leader>rh` / `<leader>hs` — preview / reset / stage hunk
- `<leader>qx` / `<leader>qX` — diagnostics to quickfix / loclist
- `<leader>qs` / `<leader>ql` — document symbols / LSP references
- `<leader>qQ` / `<leader>qL` — toggle quickfix / location list
- `<leader>tu` — undo tree
- `<leader>d*` — debugger
- `<leader>ra` / `<leader>ca` — LSP rename / code action
- `gd` / `gi` / `gr*` — LSP navigation
- `<C-s>` / `<C-c>` — save / copy whole file
- `<Tab>` / `<S-Tab>` — next / previous buffer (normal mode)
- `ZR` — restart Neovim (built-in in 0.12)

## First-time setup

1. Back up any existing `~/.config/nvim` and `~/.local/share/nvim`. chezmoi handles the copy.
2. Run `nvim`. `vim.pack` installs every plugin on first launch without asking.
3. Mason installs the LSP servers listed in `lua/plugins/lsp.lua` in the background.
4. Run `:checkhealth` to verify the setup.

Moving from the lazy.nvim version: delete `~/.local/share/nvim/lazy` and `~/.config/nvim/lazy-lock.json`.
