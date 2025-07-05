return {

    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    { 'vuciv/golf' ,
    lazy=false},
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    --  {
    --    'mrcjkb/rustaceanvim',
    --    version = '^5', -- Recommended
    --    lazy = false, -- This plugin is already lazy
    --    ft = "rust",
    --    config = function ()
    --      local mason_registry = require('mason-registry')
    --      local codelldb = mason_registry.get_package("codelldb")
    --      local extension_path = codelldb:get_install_path() .. "/extension/"
    --      local codelldb_path = extension_path .. "adapter/codelldb"
    --      local liblldb_path = extension_path.. "lldb/lib/liblldb.so"
    --	-- If you are on Linux, replace the line above with the line below:
    --	-- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    --      local cfg = require('rustaceanvim.config')
    --
    --      vim.g.rustaceanvim = {
    --        dap = {
    --          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    --        },
    --      }
    --    end
    --  },

    {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },

    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            dap.adapters.coreclr = {
                type = 'executable',
                command = '/home/dihydromonoxide/.local/share/nvim/mason/bin/netcoredbg',
                args = {'--interpreter=vscode'}
            }

            dap.adapters['godot-mono'] = {
                type = 'executable',
                command = '/home/dihydromonoxide/.local/share/nvim/mason/bin/netcoredbg',
                args = {'--interpreter=vscode'}
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end,
                },
            }

        end,
    },

    {
        'rcarriga/nvim-dap-ui', 
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            require("dapui").setup()
        end,
    },

    {
        'saecki/crates.nvim',
        ft = {"toml"},
        config = function()
            require("crates").setup {
                completion = {
                    cmp = {
                        enabled = true
                    },
                },
            }
            require('cmp').setup.buffer({
                sources = { { name = "crates" }}
            })
        end
    },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
