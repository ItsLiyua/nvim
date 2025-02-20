local utils = require("new-file-template.utils")

local src_pattern = "src/.+/kotlin/?"

local function base_template(relative_path, filename)
	local package_name = relative_path:gsub(src_pattern, ""):gsub("/", ".")
	if package_name ~= "" then
		return [[
package ]] .. package_name .. [[\n
class ]] .. utils.split(filename, "%.")[1] .. [[ {
  |cursor|
}
  ]]
	else
		return [[class ]] .. utils.split(filename, "%.")[1] .. [[ {
  |cursor|
}
  ]]
	end
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
	local template = {
		{ pattern = ".*", content = base_template },
	}

	return utils.find_entry(template, opts)
end
