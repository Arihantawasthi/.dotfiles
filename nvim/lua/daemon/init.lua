require("daemon.set")
require("daemon.remap")
require("daemon.lazy_init")


local augroup = vim.api.nvim_create_augroup
local DaemonGroup = augroup('Daemon', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = "templ",
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end
})

autocmd({"BufWritePre"}, {
    group = DaemonGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

function FormatRange()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local start_row = start_pos[2]
    local start_col = start_pos[3]
    local end_row = end_pos[2]
    local end_col = end_pos[3]

    if end_col == 0 then
        end_row = end_row - 1
        end_col = vim.fn.col({ end_row + 1, 0 }) - 1
    end

    vim.lsp.buf.format({
        range = {
            ["start"] = { start_row, start_col },
            ["end"] = { end_row, end_col }
        }
    })
end

autocmd('LspAttach', {
    group = DaemonGroup,
    callback = function (e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25

ColorMyPencils("tokyonight")
