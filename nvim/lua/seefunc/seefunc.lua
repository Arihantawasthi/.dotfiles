local M = {}

local function inspect(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. inspect(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local function create_floating_win()
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local min_width = math.ceil(width * 0.8)
    local min_height = math.ceil(height * 0.8)
    local row = math.ceil((height - min_height) / 2)
    local col = math.ceil((width - min_width) / 2)

    local opts = {
        relative = 'editor',
        width = min_width,
        height = min_height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded'
    }

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_buf_set_option(buf, 'readonly', true)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

    return buf, win
end

M.see_implementation = function ()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, result)
        if not result or vim.tbl_isempty(result) then
            print("No definition found!")
            return
        end

        local def = result[1]
        local buf, win = create_floating_win()
        print(inspect(def))

        local filename = vim.uri_to_fname(def.targetUri)
        print("FILENAME", filename)
        vim.api.nvim_buf_set_name(buf, filename)
        vim.api.nvim_command('edit ' .. filename)

        vim.api.nvim_buf_set_cursor(win, { def.range.start.line + 1, def.range.start.character })
        vim.api.nvim_set_keymap('n', '<leader>gD', ':lua require"seefunc".see_implementation()<CR>', { noremap = true, silent = true })
    end)
end

M.see_implementation()

return M
