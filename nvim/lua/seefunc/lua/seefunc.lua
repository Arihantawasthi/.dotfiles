local M = {}

local function inspect(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. inspect(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

local function create_floating_win(filename)
    -- local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    -- local min_width = math.ceil(width * 0.8)
    local min_height = math.ceil(height * 0.8)
    -- local row = math.ceil((height - min_height) / 2)
    -- local col = math.ceil((width - min_width) / 2)
    local row = 1
    local col = 2
    local min_width = 70

    local opts = {
        relative = 'editor',
        title = filename,
        width = min_width,
        height = min_height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded'
    }

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe') -- delete from memory when buf is hidden
    vim.api.nvim_buf_set_option(buf, 'relativenumber', true)
    vim.api.nvim_buf_set_option(buf, 'number', true)

    return buf, win
end

M.see_implementation = function()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result)
        if not result or vim.tbl_isempty(result) then
            print("No definition found!")
            return
        end

        local def = result[1]
        if not def or not def.targetSelectionRange or not def.targetSelectionRange.start then
            print("Invalid definition structure!")
            return
        end

        local filename = vim.uri_to_fname(def.targetUri)
        local file_content = vim.fn.readfile(filename)

        local buf, win = create_floating_win(filename)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, file_content)

        local filetype = vim.fn.fnamemodify(filename, ":e")
        vim.api.nvim_buf_set_option(buf, "filetype", filetype)

        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_option(buf, "readonly", true)

        vim.api.nvim_win_set_cursor(win, { def.targetSelectionRange.start.line + 1, def.targetSelectionRange.start.character })
        vim.api.nvim_set_keymap('n', '<leader>gD', ':lua require"seefunc".see_implementation()<CR>',
            { noremap = true, silent = true })
    end)
end

return M
