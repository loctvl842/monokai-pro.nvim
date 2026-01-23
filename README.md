<div align="center">
  <img width="484" alt="Monokai Pro" src="https://github.com/loctvl842/monokai-pro.nvim/assets/80513079/24a697cf-0bae-4bde-a059-909ca665c333">
  <h1>Monokai Pro for Neovim</h1>
  <p>Beautiful functionality for professional developers</p>
  <p>
    <a href="https://monokai.pro/">monokai.pro</a> ·
    <a href="#installation">Installation</a> ·
    <a href="#configuration">Configuration</a> ·
    <a href="#lazy-loading">Lazy Loading</a>
  </p>
</div>

> monokai-pro.nvim is under active development.
>
> Version **v2.0.0** involves a large internal refactor, so some short-term regressions are expected.
> If you encounter issues, please report them [here](https://github.com/loctvl842/monokai-pro.nvim/issues) — they help stabilize the next release.
>
> If you are maintaining a fork with fixes, please consider contributing upstream via pull requests so improvements benefit the whole community.

![monokai-pro-macbook](https://user-images.githubusercontent.com/80513079/218453999-87c957f1-658d-49a6-bf67-291d3e46fa9a.png)

## Filters

### Pro (default)
![pro](https://user-images.githubusercontent.com/80513079/209659184-ed5a28c3-cb7f-4de7-8f7c-5d206dc11540.png)

### Octagon
![octagon](https://user-images.githubusercontent.com/80513079/209659175-97db9a95-edd0-4b6e-8087-7fb1aee45c52.png)

### Machine
![machine](https://user-images.githubusercontent.com/80513079/209659194-d9fe09f5-ea35-4130-b2e8-d854b7b6fb72.png)

### Ristretto
![ristretto](https://user-images.githubusercontent.com/80513079/209659205-90200c24-d302-4b70-811a-36e6e7845f6b.png)

### Spectrum
![spectrum](https://user-images.githubusercontent.com/80513079/209659126-9df0d401-020f-4b0c-963d-5a930d0a6974.png)

### Classic
![classic](https://user-images.githubusercontent.com/80513079/209659153-9362a05f-2b7f-4b36-acf1-d13bef6a9118.png)

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup()
    vim.cmd.colorscheme("monokai-pro")
  end,
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup()
    vim.cmd.colorscheme("monokai-pro")
  end
}
```

## Configuration

```lua
require("monokai-pro").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true,
  styles = {
    comment = { italic = true },
    keyword = { italic = true },
    type = { italic = true },
    storageclass = { italic = true },
    structure = { italic = true },
    parameter = { italic = true },
    annotation = { italic = true },
    tag_attribute = { italic = true },
  },
  filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  day_night = {
    enable = false,
    day_filter = "pro",
    night_filter = "spectrum",
  },
  inc_search = "background", -- underline | background
  background_clear = {
    "toggleterm",
    "telescope",
    "renamer",
    "notify",
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      underline_fill = false,
      bold = true,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
  override = function(scheme)
    return {}
  end,
  override_palette = function(filter)
    return {}
  end,
  override_scheme = function(scheme, palette, colors)
    return {}
  end,
})
```

## Lazy Loading

Plugin highlights can be lazy-loaded to reduce initial colorscheme load time. Highlights are applied when:

- **Event-based**: A Vim event fires (e.g., `VimEnter`, `FileType`)
- **Module-based**: A module is required (e.g., `require("telescope")`)

### How It Works

Each plugin spec can define a `lazy` field:

```lua
-- Eager loading (default)
{ name = "treesitter", lazy = false }

-- Lazy loading on module require
{ name = "telescope", lazy = { module = "telescope" } }

-- Lazy loading on event
{ name = "dashboard", lazy = { event = "VimEnter" } }

-- Both triggers
{ name = "neo-tree", lazy = { module = "neo-tree", event = "FileType neo-tree" } }
```

### Check Applied Plugins

```lua
:lua print(vim.inspect(require("monokai-pro.theme.triggers").applied_plugins))
```

### Disable Specific Plugins

```lua
require("monokai-pro").setup({
  disabled_plugins = { "bufferline", "neo-tree" },
})
```

## Plugin Support

<details>
<summary>33 plugins supported</summary>

| Plugin | Lazy Loading |
|--------|--------------|
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | module |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | module |
| [blink.cmp](https://github.com/saghen/blink.cmp) | module |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | module |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | module |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) | event |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | module |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | module |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | module |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | module |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | module |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | built-in |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | module |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | module |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | module |
| [noice.nvim](https://github.com/folke/noice.nvim) | module |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | module |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | module |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | module |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | module |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | eager |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | module |
| [packer.nvim](https://github.com/wbthomason/packer.nvim) | module |
| [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | module |
| [renamer.nvim](https://github.com/filipdutescu/renamer.nvim) | module |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) | module |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | module |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | module |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | module |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | module |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | module |
| [wilder.nvim](https://github.com/gelguy/wilder.nvim) | module |
| Built-in LSP | eager |

</details>

### Lualine

```lua
require("lualine").setup({
  options = { theme = "monokai-pro" },
})
```

### Barbecue

```lua
require("barbecue").setup({
  theme = "monokai-pro",
})
```

### Lightline

```vim
let g:lightline = {'colorscheme': 'monokaipro'}
```

## Customization

### Override Highlights

```lua
require("monokai-pro").setup({
  override = function(scheme)
    return {
      Normal = { bg = "#000000" },
      IndentBlanklineChar = { fg = scheme.base.dimmed4 },
    }
  end,
})
```

### Custom Palette

```lua
require("monokai-pro").setup({
  override_palette = function(filter)
    return {
      dark2 = "#101014",
      dark1 = "#16161E",
      background = "#1A1B26",
      text = "#C0CAF5",
      accent1 = "#f7768e",
      accent2 = "#7aa2f7",
      accent3 = "#e0af68",
      accent4 = "#9ece6a",
      accent5 = "#0DB9D7",
      accent6 = "#9d7cd8",
      dimmed1 = "#737aa2",
      dimmed2 = "#787c99",
      dimmed3 = "#363b54",
      dimmed4 = "#363b54",
      dimmed5 = "#16161e",
    }
  end,
})
```

### Custom Scheme

```lua
require("monokai-pro").setup({
  override_scheme = function(scheme, palette, colors)
    return {
      editor = {
        background = colors.blend(palette.background, 0.75, "#000000"),
      },
    }
  end,
})
```

## Commands

| Command | Description |
|---------|-------------|
| `:MonokaiPro` | Select filter with picker (requires [nui.nvim](https://github.com/MunifTanjim/nui.nvim)) |
| `:MonokaiPro <filter>` | Set filter directly (e.g., `:MonokaiPro spectrum`) |
| `:MonokaiProSelect` | Alias for `:MonokaiPro` |

## Palette Reference

```lua
base = {
  dark = "#19181a",      -- darker background
  black = "#221f22",     -- background
  red = "#ff6188",       -- accent1
  green = "#a9dc76",     -- accent4
  yellow = "#ffd866",    -- accent3
  blue = "#fc9867",      -- accent2
  magenta = "#ab9df2",   -- accent6
  cyan = "#78dce8",      -- accent5
  white = "#fcfcfa",     -- text
  dimmed1 = "#c1c0c0",
  dimmed2 = "#939293",
  dimmed3 = "#727072",
  dimmed4 = "#5b595c",
  dimmed5 = "#403e41",
}
```

## License

MIT
