-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"pyright", -- python setup
		"jdtls", -- java
		"tsserver", -- this is for typescript
		"html", -- html
		"cssls", -- css
		"sqlls", -- SQL
		"tailwindcss", -- tailwindcss
		"lua_ls",
		"emmet_ls",
	},
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
	-- configure sources for specific languages
	sources = {
		python = {
			"black",
			"isort",
			"flake8",
		},
		java = {
			"google-java-format",
			"checkstyle",
		},
	},
})
