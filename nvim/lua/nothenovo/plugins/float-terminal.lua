-- Floating terminal

return {
  {
    'voldikss/vim-floaterm',
    init = function()
      vim.g.floaterm_keymap_new    = '<F7>'
      vim.g.floaterm_keymap_prev   = '<F8>'
      vim.g.floaterm_keymap_next   = '<F9>'
      vim.g.floaterm_keymap_toggle = '<F12>'
    end,

  config = function()

    local function run_file()
      vim.cmd("w")

      local ft = vim.bo.filetype
      local file = vim.fn.expand("%")
      local file_no_ext = vim.fn.expand("%:r")

      local cmd = ""

      -- NOTE: python file excution 
      if ft == "python" then
        cmd = 'python "' .. file .. '"'

      -- NOTE: C file excution 
      elseif ft == "c" then
        cmd = 'gcc "' .. file .. '" -o "' .. file_no_ext .. '.exe" && "' .. file_no_ext .. '.exe"'


      -- NOTE: java file excution and package detection
      elseif ft == "java" then

        local file = vim.fn.expand("%")
        local file_name = vim.fn.expand("%:t:r")
        local dir = vim.fn.expand("%:p:h")
        local root = vim.fn.getcwd()

        local relative = vim.fn.fnamemodify(dir, ":.")
        relative = relative:gsub("\\", ".")

        local full_class = relative .. "." .. file_name

        cmd = 'cd "' .. root .. '" && javac "' .. file .. '" && java ' .. full_class

      -- NOTE: javascript file excution 
      elseif ft == "javascript" then
        cmd = 'node "' .. file .. '"'

      else
        print("Unsupported filetype: " .. ft)
        return
      end

      vim.cmd("FloatermNew --autoclose=0 " .. cmd)
    end

    vim.keymap.set("n", "<F5>", run_file, { silent = true })
    vim.keymap.set("i", "<F5>", function()
      vim.cmd("stopinsert")
      run_file()
    end, { silent = true })

  end,
  },
}







-- BUG: leagcy code only works for python

-- return {
--   {
--     'voldikss/vim-floaterm',
--     init = function()
--       vim.g.floaterm_keymap_new    = '<F7>'
--       vim.g.floaterm_keymap_prev   = '<F8>'
--       vim.g.floaterm_keymap_next   = '<F9>'
--       vim.g.floaterm_keymap_toggle = '<F12>'
--     end,
--     config = function()
--       vim.api.nvim_create_autocmd('FileType', {
--         pattern = 'python',
--         callback = function()
--           vim.api.nvim_set_keymap('n', '<F5>', ':w<CR>:FloatermNew --autoclose=0 python %<CR>', { noremap = true, silent = true })
--           vim.api.nvim_set_keymap('i', '<F5>', '<ESC>:w<CR>:FloatermNew --autoclose=0 python %<CR>', { noremap = true, silent = true })
--         end
--       })
--     end
--   },
-- }
