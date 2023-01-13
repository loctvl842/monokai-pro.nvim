<div align="center">
    <div class="b-header">
        <a class="active" href="https://github.com/loctvl842/monokai-pro.nvim">
            <img style="width: 16rem" src="https://user-images.githubusercontent.com/80513079/209661594-1fa9abea-825a-4b1c-91d6-f6634d68f94e.svg" alt="">
            <h1>Monokai Pro</h1>
            <h2>Beautiful functionality for professional developers</h2>
        </a>
    </div>
</div>

Credit goes to the original creator [Monokai Pro](https://monokai.pro/)

## ⭐ Pro

![pro](https://user-images.githubusercontent.com/80513079/209659184-ed5a28c3-cb7f-4de7-8f7c-5d206dc11540.png)

## 🛑 Octagon

![octagon](https://user-images.githubusercontent.com/80513079/209659175-97db9a95-edd0-4b6e-8087-7fb1aee45c52.png)

## 🎰 Machine

![machine](https://user-images.githubusercontent.com/80513079/209659194-d9fe09f5-ea35-4130-b2e8-d854b7b6fb72.png)

## ☕ Ristretto

![ristretto](https://user-images.githubusercontent.com/80513079/209659205-90200c24-d302-4b70-811a-36e6e7845f6b.png)

## 🎨 Spectrum

![spectrum](https://user-images.githubusercontent.com/80513079/209659126-9df0d401-020f-4b0c-963d-5a930d0a6974.png)

## 👴 Classic

![classic](https://user-images.githubusercontent.com/80513079/209659153-9362a05f-2b7f-4b36-acf1-d13bef6a9118.png)

### ⚓ Plugin support

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [bufferLine.nvim](https://github.com/akinsho/bufferline.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [renamer.nvim](https://github.com/filipdutescu/renamer.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [breadcrumb.nvim](https://github.com/loctvl842/breadcrumb.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [wilder.nvim](https://github.com/gelguy/wilder.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)

## 📦 Installation

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'loctvl842/monokai-pro.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup()
  end
}
```

## ⚙ Configuration

There are several themes included in this plugin.

- [Pro](#-pro) – Monokai Pro _(default)_
- [Octagon](#-octagon) – Monokai Pro (Filter Octagon)
- [Machine](#-machine) – Monokai Pro (Filter Machine)
- [Ristretto](#-ristretto) – Monokai Pro (Filter Machine)
- [Spectrum](#-spectrum) – Monokai Pro (Filter Machine)
- [Classic](#-classic) – Monokai Classic

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
      underline_selected = false,
      underline_visible = false,
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
    renamer = {
      background_clear = true,
    },
    indent_blankline = {
      context_highlight = "default" -- default | pro
    },
  }
})
```

- Reference my [nvim](https://github.com/loctvl842/nvim) to see my plugins setup for `border` if you want to set `background_clear = false`

## 🔥 Usage

- Enable this colorscheme by using the following command after `setup`:

```vim
" Vim Script
colorscheme monokai-pro
```

```lua
require("monokai-pro").setup({
  -- ... your config
})
-- lua
vim.cmd([[colorscheme monokai-pro]])
```

- To enable `monokai-pro` for `Lualine`:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'monokai-pro'
    -- ... your lualine config
  }
}
```

- To enable `moonokai-pro` for `lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'monokaipro'}
```

## ✍ Command

- run command `MonokaiProSelect` to launch a menu to choose theme filter (required: [nui.nvim](https://github.com/MunifTanjim/nui.nvim))
- or we can run command `MonokaiPro` with parameter to change theme filter: For example:
  > `MonokaiPro classic`
