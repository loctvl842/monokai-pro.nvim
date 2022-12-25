<div align="center">
    <div class="b-header">
        <a class="active" href="https://github.com/loctvl842/monokai-pro.nvim">
            <img style="width: 16rem" src="./assets/logo.svg" alt="">
            <h1>Monokai Pro</h1>
            <h2>Beautiful functionality for professional developers</h2>
        </a>
    </div>
</div>

Credit goes to the original creator [Monokai Pro](https://monokai.pro/)

## 📦 Installation

```lua
use {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({})
  end
}
```

## ⚙ configuration

There are several themes included in this plugin.

- [Pro](#Pro) – Monokai Pro _(default)_
- [Octagon](#Octagon) – Monokai Pro (Filter Octagon)
- [Machine](#Machine) – Monokai Pro (Filter Machine)
- [Ristretto](#Ristretto) – Monokai Pro (Filter Machine)
- [Spectrum](#Spectrum) – Monokai Pro (Filter Machine)
- [Classic](#Classic) – Monokai Classic

Example configuration:

```lua
require("monokai-pro").setup({
  transparent_background = true,
  italic_comments = true,
  filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  inc_search = "underline", -- underline | background
  diagnostic = {
    background = true,
  },
  plugins = {
    bufferline = {
      underline_selected = true,
    },
    toggleterm = {
      background_clear = true,
    },
    telescope = {
      background_clear = true,
    }
    cmp = {
        background_clear = true,
    },
    whichkey = {
      background_clear = true,
    },
    indent_blankline = {
      context_highlight = "default" -- default | pro
    },
  }
})
```

- Reference my [nvim config](https://github.com/loctvl842/nvim) to see my plugins setup for `border` if you want to set `background_clear = false`

## ✍ Command

- run command `MonokaiProSelect` to launch a menu to choose theme filter (required: [nui.nvim](https://github.com/MunifTanjim/nui.nvim))
- or we can run command `MonokaiPro` with parameter to change theme filter: For example:
  > `MonokaiPro classic`

## ⚓ Plugin support

- ##### [alpha-nvim](https://github.com/goolord/alpha-nvim)
- ##### [bufferLine.nvim](https://github.com/akinsho/bufferline.nvim)
- ##### [Cmp](https://github.com/hrsh7th/nvim-cmp)
- ##### [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- ##### [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- ##### [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- ##### [nvim-notify](https://github.com/rcarriga/nvim-notify)
- ##### [renamer.nvim](https://github.com/filipdutescu/renamer.nvim)
- ##### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- ##### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- ##### [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- ##### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- ##### [which-key.nvim](https://github.com/folke/which-key.nvim)
- ##### [breadcrumb.nvim](https://github.com/loctvl842/breadcrumb.nvim)
- ##### [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- ##### [wilder.nvim](https://github.com/gelguy/wilder.nvim)

## Pro

![image](./assets/pro.png)

## Octagon

![image](./assets/octagon.png)

## Machine

![image](./assets/machine.png)

## Ristretto

![image](./assets/ristretto.png)

## Spectrum

![image](./assets/spectrum.png)

## Classic

![image](./assets/classic.png)

## TODO

- [ ] Fix icons in bufferline
- [ ] options for border in Telescope (float, get_theme)
- [ ] options for border in NeoTree
- [ ] options for border in cmp
- [ ] options for border session-lens
- [ ] fix bufferlineCloseButtonVisible
- [ ] fix lualine theme
- [ ] options for border in whichkey
