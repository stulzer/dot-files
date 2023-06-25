local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.deno_fmt,
	b.formatting.prettier.with({
		filetypes = {
			"html",
			"markdown",
			"css",
			"ts",
			"tsx",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	}),

	b.formatting.stylua,
}

if vim.fn.filereadable("Gemfile") == 1 then
	local gemfile = io.open("Gemfile", "r"):read("*a")

	if string.find(gemfile, "rubocop") then
		table.insert(sources, b.formatting.rubocop)
		table.insert(sources, b.diagnostics.rubocop)
	else
		table.insert(sources, b.formatting.standardrb)
		table.insert(sources, b.diagnostics.standardrb)
	end
end

null_ls.setup({
	debug = true,
	sources = sources,
})
