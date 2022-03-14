local api = vim.api
local bo = vim.bo

local M = {}
-- TODO: add
--      1) first non-whitespace chara comment
--      2) indent based block comment
-- modes

function M.setup(config)
    if config ~= nil then
        M.config = config
    else
        require('luament.tmp')
        M.config = Def_conf
    end

    M.comment_str = nil

    api.nvim_command("command! -range LuamentToggle lua require('luament.luament').comment_toggle(<line1>, <line2>)")
end

function M.comment_toggle(line_start, line_end)
    local lines = api.nvim_buf_get_lines(0, line_start - 1, line_end, false)

    M.cmt_str = M.config.comment_strs[bo.filetype]
    if M.cmt_str == nil then
        do return end
    end

    for i,_ in pairs(lines) do
        if M.is_commented(lines[i]) then
            lines[i] = M.uncomment_line(lines[i])
        else
            lines[i] = M.comment_line(lines[i])
        end
    end

    api.nvim_buf_set_lines(0, line_start - 1, line_end, false, lines)
end

function M.is_commented(line)
    if string.sub(line, 1, #M.cmt_str) == M.cmt_str then
        return true
    else
        return false
    end
end

function M.comment_line(line)
    return M.cmt_str .. line
end

function M.uncomment_line(line)
    return string.sub(line, #M.cmt_str + 1, #line)
end

return M
