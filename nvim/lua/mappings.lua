require "nvchad.mappings"

-- Show Rails Routes function used on <leader>cR below
function ShowRoutes()
  vim.api.nvim_command ":topleft 100 :split __Routes__"
  vim.api.nvim_command ":set buftype=nofile"
  vim.api.nvim_command ":normal 1GdG"
  vim.api.nvim_command ":0r! bundle exec rails routes"
  vim.api.nvim_command ':exec ":normal " . line("$") . "^W_ "'
  vim.api.nvim_command ":normal 1GG"
  vim.api.nvim_command ":normal dd"
  vim.api.nvim_command ":normal gg"
  vim.api.nvim_command ":normal /Prefix"
  vim.api.nvim_command ":normal k"
  vim.api.nvim_command ":normal dgg"
end

-- Rename file function used on <leader>rn below
function RenameFile()
  local old_name = vim.fn.expand "%"
  local new_name = vim.fn.input("New name: ", old_name)
  if new_name ~= old_name then
    vim.fn.execute("saveas " .. new_name)
    vim.fn.execute("silent !rm " .. old_name)
  end
end

-- Pipes current buffer into jq to format json used on <leader>j below
function FormatJSON()
  vim.api.nvim_command "%! jq -S"
end

-- Reads a .runner file on the root of the project and runs it as bash with && for each line as a command
function Runner()
  local runner = vim.fn.findfile(".runner", ".;")
  if runner ~= "" then
    local file = io.open(runner, "r")

    if file == nil then
      print "Error opening file"
      return
    end

    local commands = ""

    -- join all lines with &&
    for line in file:lines() do
      commands = commands .. line .. " && "
    end

    -- Remove last &&
    commands = string.sub(commands, 1, -5)

    -- Open a new split and run the commands
    vim.api.nvim_command("terminal " .. commands)

    file:close()
  else
    print "No .runner file found"
  end
end

local map = vim.keymap.set

map("n", "<leader>rn", "<cmd>lua RenameFile()<CR>", { desc = "Rename current buffer" })
map("n", "<leader>cR", "<cmd>lua ShowRoutes()<CR>", { desc = "Show routes" })
map("n", "<leader>j", "<cmd>lua FormatJSON()<CR>", { desc = "Formats current buffer in JSON via jq" })
map("n", "<leader>R", "<cmd>lua Runner()<CR>", { desc = "Detect a .runner file and execute it" })
map("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map(
  "n",
  "<leader>cm",
  "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'app/models' } <CR>",
  { desc = "Find Models" }
)
map(
  "n",
  "<leader>ct",
  "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'app/controllers' } <CR>",
  { desc = "Find Controllers" }
)
map(
  "n",
  "<leader>cv",
  "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'app/views' } <CR>",
  { desc = "Find Views" }
)
map("n", "<leader>cs", "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'spec/' } <CR>", { desc = "Find Specs" })
map("n", "<leader>tt", "<cmd>tabnew <CR>", { desc = "New Native vim Tab" })
map("n", "<leader>tc", "<cmd>tabclose <CR>", { desc = "Close Native vim Tab" })
map("n", "<leader>tn", "<cmd>tabnext <CR>", { desc = "Next Native vim Tab" })
map("n", "<leader>tp", "<cmd>tabprevious <CR>", { desc = "Previous Native vim Tab" })
map("n", "<leader>w", "<cmd>w <CR>", { desc = "Save" })
map("n", "<leader>a", "<cmd>wa <CR>", { desc = "Save All" })
map("n", "<leader>s", "<cmd>VroomRunNearestTest <CR>", { desc = "Run Near Test" })
map("n", "<leader>S", "<cmd>VroomRunTestFile <CR>", { desc = "Run Whole Test File" })
map("n", "<leader>q", "<cmd>noh <CR>", { desc = "Clear Highlight" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste above from system clipboard" })
map("n", "<leader><leader>", "<c-^>", { desc = "Switch Back Latest Buffer" })
map("v", "H", "^", { desc = "End of Line" })
map("v", "L", "$", { desc = "Beginning of Line" })
map("n", "H", "^", { desc = "End of Line" })
map("n", "L", "$", { desc = "Beginning of Line" })
map("n", "<leader>md", "<cmd>silent !mkdir -p %:h<CR> :redraw! <CR>", { desc = "Create current directory" })
map("n", "<leader>l", "<cmd>set list!<CR>", { desc = "Show invisibles" })
map("n", "+", "<C-a>", { desc = "Add to a number on the line" })
map("n", "-", "<C-x>", { desc = "Subtract from a number on the line" })
map("n", "_", "<C-x>", { desc = "Subtract from a number on the line" })
map("n", "<C-x>", "<cmd>Inspect<CR>", { desc = "Show syntax stack" })

-- Visual mode mappings
map("v", "L", "$", { desc = "Beginning of Line" })
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("v", "<leader>P", '"+P', { desc = "Paste above from system clipboard" })

-- Command mode mappings
map("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { desc = "Show current file directory" })

-- Rewrite default to handle LSP timeouts
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true, timeout_ms = 5000 }
end, { desc = "Format Files" })

local function create_alternate_file()
  local success, err = pcall(function() vim.api.nvim_command(":A") end)
  if not success and err then
    local file_path = err:match('E345: Can\'t find file "([^"]+)" in path')
    if file_path then
      vim.cmd('edit ' .. file_path)
      vim.cmd('write')
      print('Created file: ' .. file_path)
    else
      print('Error: ' .. err)
    end
  end
end

vim.api.nvim_create_user_command('CA', create_alternate_file, { bang = true })
