return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
        "iurimateus/luasnip-latex-snippets.nvim",
    },
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        require("luasnip").config.set_config({
            enable_autosnippets = true,
        })
        require("luasnip-latex-snippets").setup({ use_treesitter = true })

        ls.add_snippets("tex", {

            s("beginfigure", {
                t("\\begin{figure}[H]"),
                t({ "", "  \\centering" }),
                t({ "", "  \\hrule" }),
                t({ "", "  \\vspace{0.5em}" }),
                t({ "", "  \\includegraphics[width=0.5\\linewidth]{" }), i(1, "example-image"), t("}"),
                t({ "", "  \\caption{" }), i(2, "Your caption here"), t("}"),
                t({ "", "  \\label{fig:" }), i(3, "label"), t("}"),
                t({ "", "  \\vspace{0.5em}" }),
                t({ "", "  \\hrule" }),
                t({ "", "\\end{figure}" }),
            }),

            s("begintable", {
                t("\\begin{table}[H]"),
                t({ "", "  \\centering" }),
                t({ "", "  \\caption{" }), i(3, "Your caption here"), t("}"),
                t({ "", "  \\begin{tabular}{" }), i(1, "c"), t("}"),
                t({ "", "    " }), i(2, "content"),
                t({ "", "  \\end{tabular}" }),
                t({ "", "  \\label{tab:" }), i(4, "label"), t("}"),
                t({ "", "\\end{table}" }),
            }),

            s("subfig1", {
                t("\\begin{subfigure}[b]{"), i(1, "0.45"), t("\\textwidth}"),
                t({ "", "\t\\centering" }),
                t({ "", "\t\\includegraphics[width=\\textwidth]{" }), i(2, "image.png"), t("}"),
                t({ "", "\t\\caption{" }), i(3, "Caption"), t("}"),
                t({ "", "\t\\label{fig:" }), i(4, "label"), t("}"),
                t({ "", "\\end{subfigure}" }),
            }),

        })

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.jumpable(1) then ls.jump(1) end
        end)
        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            if ls.jumpable(-1) then ls.jump(-1) end
        end)
    end
}
