return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = function()
					---@diagnostic disable-next-line: return-type-mismatch
					return vim.loop.cwd()
				end,
			},
		})

		vim.keymap.set("n", "<A-a>", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<A-w>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-f>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-g>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-p>", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader><A-w>", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<leader><A-f>", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<leader><A-g>", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<leader><A-p>", function()
			harpoon:list():replace_at(4)
		end)
		vim.keymap.set("n", "<leader><A-s>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<A-s>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
