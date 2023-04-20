-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  -- 文档树
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- 文档树图标
    }
  }
  -- 用C-hjkl切换窗口
  use "christoomey/vim-tmux-navigator"
  -- Theme
  use 'Mofiqul/dracula.nvim'
  -- State Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  -- Syntax Hightlight
  use "nvim-treesitter/nvim-treesitter"
  use "p00f/nvim-ts-rainbow" -- 配合treesitter，不同括号颜色区分
  -- Manage LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }
  -- Auto-complete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use 'hrsh7th/cmp-vsnip' -- vsnip
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use "rafamadriz/friendly-snippets"
  -- Function Signature
  use {"ray-x/lsp_signature.nvim"}
  -- 文件路径
  use "hrsh7th/cmp-path" -- 文件路径
  -- gcc和gc注释
  use "numToStr/Comment.nvim" -- gcc和gc注释
  -- 自动补全括号
  use "windwp/nvim-autopairs" -- 自动补全括号
  -- buffer
  use "akinsho/bufferline.nvim"
  -- 文件检索
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

