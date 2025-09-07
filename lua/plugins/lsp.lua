-- ~/.config/nvim/lua/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
        local lspconfig = require("lspconfig")

        local on_attach = function(client, bufnr)
            local bufmap = function(mode, lhs, rhs)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            bufmap("n", "gd", vim.lsp.buf.definition)
            bufmap("n", "K", vim.lsp.buf.hover)
            bufmap("n", "gr", vim.lsp.buf.references)
            bufmap("n", "<leader>rn", vim.lsp.buf.rename)
            bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Pyright (npm)
        lspconfig.pyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        -- Clangd (через системний пакет Alpine)
        lspconfig.clangd.setup {
            cmd = { "/usr/bin/clangd" },
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
}

