<h1 align="center">:cyclone: AtomVim :cyclone:</h1>

<p align="center">

<img alt="GitHub Created At" src="https://img.shields.io/github/created-at/adiyat-abubakirov/atom-vim?style=for-the-badge">
<img alt="GitHub Release" src="https://img.shields.io/github/v/release/adiyat-abubakirov/atom-vim?sort=date&display_name=release&style=for-the-badge">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/adiyat-abubakirov/atom-vim?style=for-the-badge">
<img alt="GitHub License" src="https://img.shields.io/github/license/adiyat-abubakirov/atom-vim?style=for-the-badge">

</p>

![Demo Of AtomVim](.github/gifs/Demo.gif)

> [!NOTE]
>
> - **For demonstration of features, see [Demonstrations](https://github.com/adiyat-abubakirov/atom-vim/wiki/Demonstrations).**
> - **Feel free to take some parts/ideas of my build for your own one.**

## :rocket: Key Features

- Method Extraction, Delegate Method Generation, Class test, Import Organization, Jump-To Definition, Method & Constructor Generation, Diagnostics, Lombok Integration, and more is done using [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls), but Code Formatting is done using [google-java-format](https://github.com/google/google-java-format) for the most up-to-date Google Java Style code formatting standards.
- All 3rd-party programs are managed using [mason.nvim](https://github.com/mason-org/mason.nvim). All the [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) dependencies are managed by [mason.nvim](https://github.com/mason-org/mason.nvim).
- [Nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) is configured standalone in [`java.lua`](ftplugin/java.lua), while other LSP's are configured using [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- [None-ls](https://github.com/nvimtools/none-ls.nvim) is used to manage standalone LSP features such as [google-java-format](https://github.com/google/google-java-format).
- [Which-key](https://github.com/folke/which-key.nvim) is used to give a hint for custom keymappings.
- Code Completion is integrated using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is used for syntax-highlighting.
- Debugging is integrated using [nvim-dap](https://github.com/mfussenegger/nvim-dap) with [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) for UI display.
- Plugin Manager - [lazy.nvim](https://lazy.folke.io/).

## :mag: Configuration Layout

    ├── ftplugin/                       files loaded with filetype
    │   └── java.lua                    nvim-jdtls config file
    ├── init.lua                        start-up file
    └── lua/                            files loaded by lua
        ├── lazynvim.lua                lazy.nvim config file
        ├── neovim-config.lua           settings for neovim
        └── plugins/                    all nvim plugin config files (loaded by lazynvim.lua)

## :bulb: Personal Suggestions

- For beginners in Neovim, I recommend checking [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/tree/master), because it has the best introduction into Neovim.
- To search for Neovim plugins, I recommend [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) & [dotfyle](https://dotfyle.com/).

---

<h3 align=center>If you found this repository helpful, please give it a :star:</h3>

## List Of Used Plugins

- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- [harpoon-lualine](https://github.com/letieu/harpoon-lualine)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-nio](https://github.com/nvim-neotest/nvim-nio)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
