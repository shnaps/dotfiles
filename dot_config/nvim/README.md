# nvim

Standalone Neovim config (kickstart-style, lazy.nvim).

Migrated from NvChad v2.5 in May 2026.

## Requirements

- **Neovim 0.11+** (uses `vim.lsp.config` API)
- `git`, `make`, a C compiler (for some plugins)
- `tree-sitter` CLI (for nvim-treesitter `main` branch)
- A Nerd Font (for icons)
- `ripgrep` (for fzf-lua live grep)
- `fzf` (for fzf-lua)

## Layout

```
nvim/
├── init.lua                 -- entry point
└── lua/
    ├── config/              -- core config (not plugins)
    │   ├── options.lua      -- vim.opt settings
    │   ├── lazy.lua         -- lazy.nvim bootstrap
    │   ├── autocmds.lua     -- autocommands
    │   ├── keymaps.lua      -- non-plugin keymaps
    │   ├── lsp.lua          -- LSP setup (vim.lsp.config + LspAttach mappings)
    │   └── utils.lua        -- helper functions
    └── plugins/             -- plugin specs (one file per area)
        ├── colorscheme.lua  -- tokyonight
        ├── ui.lua           -- lualine, noice, indent-blankline, which-key, dressing
        ├── editor.lua       -- snacks (explorer), autopairs, illuminate, hardtime, zen-mode, precognition
        ├── fzf.lua          -- fzf-lua (replaces telescope)
        ├── treesitter.lua   -- nvim-treesitter (main branch)
        ├── lsp.lua          -- mason 2.0, lspconfig, neoconf, typescript-tools, nvim-java
        ├── coding.lua       -- blink.cmp (replaces nvim-cmp)
        ├── formatting.lua   -- conform.nvim
        ├── trouble.lua      -- folke/trouble.nvim
        ├── git.lua          -- gitsigns, neogit
        ├── dap.lua          -- nvim-dap, dap-ui, dap-virtual-text, mason-nvim-dap
        └── typst.lua        -- typst-preview
```

## What changed from the previous (NvChad-based) config

- **Standalone** — no NvChad dependency. UI plugins replaced (lualine, indent-blankline, snacks.nvim explorer).
- **LSP** — migrated from `require('lspconfig').xxx.setup{}` (deprecated) to `vim.lsp.config` + `vim.lsp.enable` (Nvim 0.11+).
- **Mason** — upgraded to v2.0 (`mason-org/mason.nvim`, `automatic_enable` flow).
- **Treesitter** — migrated to the `main` branch (full rewrite). `master` is frozen and won't work with Nvim 0.12.
- **Completion** — `nvim-cmp` replaced with `blink.cmp`.
- **Fuzzy finder** — `telescope` replaced with `fzf-lua`. `telescope-undo` and `telescope-dap` removed (fzf-lua has equivalents).
- **File explorer** — `nvim-tree` replaced with `snacks.explorer`.
- **Colorscheme** — NvChad's base46 replaced with `tokyonight`.

## Keymaps

Leader is `<space>`. Run `<leader>ch` (cheatsheet) or `<leader>?` (buffer-local) for the full list. NvChad muscle-memory shortcuts are preserved where possible. Highlights:

- `<leader>ff` — find files
- `<leader>fa` — find all files (hidden)
- `<leader>fw` — live grep
- `<leader>fb` — find buffers
- `<leader>fo` — recent files
- `<leader>fz` — fuzzy search current buffer
- `<leader>e` / `<C-n>` — file explorer
- `<leader>ch` — cheatsheet (NvCheatsheet replacement)
- `<leader>?`  — buffer-local keymaps
- `<leader>n` / `<leader>rn` — toggle line numbers / relative
- `<leader>/` — toggle comment
- `<leader>fm` / `<leader>cf` — format buffer
- `<leader>gn` — neogit
- `<leader>gb` — git blame line
- `<leader>gl/gh/ga/gd` — noice last/history/all/dismiss
- `<leader>gg` — open GitHub link from string under cursor
- `<leader>ph` / `<leader>rh` / `<leader>hs` — preview / reset / stage hunk
- `<leader>q*` — trouble (diagnostics, symbols, lsp, qflist)
- `<leader>d*` — debugger
- `<leader>ra` / `<leader>ca` — LSP rename / code action
- `gd` / `gi` / `gr*` — LSP nav (definition, implementation, Nvim 0.11+ defaults)
- `<C-s>` / `<C-c>` — save / copy whole file
- `<Tab>` / `<S-Tab>` — buffer next / previous

The dashboard (snacks.dashboard) shows on startup with file/grep/recent/config/lazy/mason shortcuts — the NvDash equivalent.

## First-time setup

1. Backup any existing `~/.config/nvim` and `~/.local/share/nvim` (chezmoi handles symlinking).
2. Run `nvim` — lazy.nvim bootstraps, plugins install on first launch.
3. Run `:Mason` and let it install the LSP servers listed in `plugins/lsp.lua`.
4. Run `:checkhealth` to verify everything's wired up.
