<div align="center">
    <div class="b-header">
        <a class="active" href="https://monokai.pro/">
            <img style="width: 16rem" src="./assets/logo.svg" alt="">
            <h1>Monokai Pro</h1>
            <h2>Beautiful functionality for professional developers</h2>
        </a>
    </div>
</div>

Credit goes to the original creator [Monokai Pro](https://monokai.pro/)

## 📦 Installation
```lua
use("loctvl842/monokai-pro.nvim")
```

## ⚙️ Configuration
## Config

There are several themes included in this plugin.

* [Pro](#Pro) – Monokai Pro *(default)*
* [Octagon](#Octagon) – Monokai Pro (Filter Octagon)
* [Machine](#Machine) – Monokai Pro (Filter Machine)
* [Ristretto](#Ristretto) – Monokai Pro (Filter Machine)
* [Spectrum](#Spectrum) – Monokai Pro (Filter Machine)
* [Classic](#Classic) – Monokai Classic

Example configuration:

```lua
require("monokai-pro").setup({
	transparent_background = false, -- better set to false
	italic_comments = true,
	theme = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
})
```

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
