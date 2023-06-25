-- Show Rails Routes function used on <leader>cR below
function ShowRoutes()
	vim.api.nvim_command(":topleft 100 :split __Routes__")
	vim.api.nvim_command(":set buftype=nofile")
	vim.api.nvim_command(":normal 1GdG")
	vim.api.nvim_command(":0r! bundle exec rails routes")
	vim.api.nvim_command(':exec ":normal " . line("$") . "^W_ "')
	vim.api.nvim_command(":normal 1GG")
	vim.api.nvim_command(":normal dd")
	vim.api.nvim_command(":normal gg")
	vim.api.nvim_command(":normal /Prefix")
	vim.api.nvim_command(":normal k")
	vim.api.nvim_command(":normal dgg")
end

-- Rename file function used on <leader>rn below
function RenameFile()
	local old_name = vim.fn.expand("%")
	local new_name = vim.fn.input("New name: ", old_name)
	if new_name ~= old_name then
		vim.fn.execute("saveas " .. new_name)
		vim.fn.execute("silent !rm " .. old_name)
	end
end

-- Pipes current buffer into jq to format json used on <leader>j below
function FormatJSON()
	vim.api.nvim_command("%! jq")
end

-- Reads a .runner file on the root of the project and runs it as bash with && for each line as a command
function Runner()
	local runner = vim.fn.findfile(".runner", ".;")
	if runner ~= "" then
		local file = io.open(runner, "r")

		if file == nil then
			print("Error opening file")
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
		vim.api.nvim_command(":sp")
		vim.api.nvim_command("terminal " .. commands)

		file:close()
	else
		print("No .runner file found")
	end
end

local M = {}

M.general = {
	-- Normal mode mappings
	n = {
		["<leader>rn"] = { "<cmd>lua RenameFile()<CR>", "Rename current buffer" },
		["<leader>cR"] = { "<cmd>lua ShowRoutes()<CR>", "Show routes" },
		["<leader>j"] = { "<cmd>lua FormatJSON()<CR>", "Formats current buffer in JSON via jq" },
		["<leader>R"] = { "<cmd>lua Runner()<CR>", "Detect a .runner file and execute it" },
		["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>cm"] = { "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'app/models' } <CR>", "Find Models" },
		["<leader>ct"] = {
			"<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'app/controllers' } <CR>",
			"Find Controllers",
		},
		["<leader>cv"] = { "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'app/views' } <CR>", "Find Views" },
		["<leader>cs"] = { "<cmd>lua require 'telescope.builtin'.find_files{ cwd = 'spec/' } <CR>", "Find Specs" },
		["<leader>tt"] = { "<cmd>tabnew <CR>", "New Native vim Tab" },
		["<leader>tc"] = { "<cmd>tabclose <CR>", "Close Native vim Tab" },
		["<leader>tn"] = { "<cmd>tabnext <CR>", "Next Native vim Tab" },
		["<leader>tp"] = { "<cmd>tabprevious <CR>", "Previous Native vim Tab" },
		["<leader>w"] = { "<cmd>w <CR>", "Save" },
		["<leader>a"] = { "<cmd>wa <CR>", "Save All" },
		["<leader>s"] = { "<cmd>VroomRunNearestTest <CR>", "Run Near Test" },
		["<leader>S"] = { "<cmd>VroomRunTestFile <CR>", "Run Whole Test File" },
		["<leader>q"] = { "<cmd>noh <CR>", "Clear Highlight" },
		["<leader>p"] = { '"+p', "Paste from system clipboard" },
		["<leader>P"] = { '"+P', "Paste above from system clipboard" },
		["<leader><leader>"] = { "<c-^>", "Switch Back Latest Buffer" },
		["H"] = { "^", "End of Line" },
		["L"] = { "$", "Beginning of Line" },
		["<leader>md"] = { "<cmd>silent !mkdir -p %%<CR> :redraw! <CR>", "Create current directory" },
		["<leader>l"] = { "<cmd>set list!<CR>", "Show invisibles" },
	},

	-- Visual mode mappings
	v = {
		["H"] = { "^", "End of Line" },
		["L"] = { "$", "Beginning of Line" },
		["<leader>y"] = { '"+y', "Copy to system clipboard" },
		["<leader>p"] = { '"+p', "Paste from system clipboard" },
		["<leader>P"] = { '"+P', "Paste above from system clipboard" },
	},

	-- Command mode mappings
	c = {
		["%%"] = { "<C-R>=expand('%:h').'/'<cr>", "Show current file directory" },
	},
}

return M
