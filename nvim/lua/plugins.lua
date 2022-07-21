local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
    vim.cmd([[
        augroup packer_user_config
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        augroup end
    ]])

    -- Plugins
    local packer = require "packer"
    packer.startup({
        function(use)
            -- Packer can manage itself
            use 'wbthomason/packer.nvim'

            -- Colorscheme
            use {
                "sainnhe/everforest",
                config = function()
                    vim.cmd "colorscheme everforest"
                end,
            }

            -- Automatically set up your configuration after cloning packer.nvim
            -- Put this at the end after all plugins
            if packer_plugins then
                require('packer').sync()
            end
        end,
        config = {
            display = {
              open_fn = require('packer.util').float,
            }
        }
    })
end

return M