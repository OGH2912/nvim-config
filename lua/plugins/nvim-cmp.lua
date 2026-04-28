return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "f3fora/cmp-spell",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            completion = {
                autocomplete = {
                    require("cmp.types").cmp.TriggerEvent.TextChanged
                }
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.expandable() then
                        luasnip.expand()
                    elseif cmp.visible() then
                        cmp.confirm({ select = true })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Esc>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                    else
                        fallback()
                    end
                end),
            }),

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
                { name = "spell" },
            }),

            formatting = {
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        luasnip  = "[Snip]",
                        buffer   = "[Buf]",
                        nvim_lsp = "[LSP]",
                        path     = "[Path]",
                        spell    = "[Spell]",
                    })[entry.source.name]

                    return vim_item
                end
            },
        })
    end
}

