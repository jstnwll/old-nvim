-- General
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--Nvim-cmp
local cmp = require("cmp")

vim.keymap.set("i", "<C-y>", function()
	cmp.confirm({ select = true })
end, { desc = "Accept" })

vim.keymap.set("i", "<C-Space>", function()
	if cmp.visible() then
		cmp.open_docs()
	else
		cmp.complete()
	end
end, { desc = "Open menu or open docs if already open" })

vim.keymap.set("i", "<C-n>", function()
	cmp.select_next_item()
end, { desc = "Select next item" })
vim.keymap.set("i", "<C-p>", function()
	cmp.select_prev_item()
end, { desc = "Select previous item" })
vim.keymap.set("i", "<Down>", function()
	cmp.select_next_item()
end, { desc = "Select next item" })
vim.keymap.set("i", "<Up>", function()
	cmp.select_prev_item()
end, { desc = "Select previous item" })

vim.keymap.set("i", "<C-e>", function()
	cmp.abort()
end, { desc = "Hide menu" })

vim.keymap.set("i", "<C-k>", function()
	local signature = require("cmp.config").get().window.documentation
	if signature and signature.enabled then
		vim.lsp.buf.signature_help()
	end
end, { desc = "Toggle signature help (if signature.enabled = true)" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
