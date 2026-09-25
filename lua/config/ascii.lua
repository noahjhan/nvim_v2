math.randomseed(os.time())

local function random_element(list)
  return list[math.random(#list)]
end

local function read_lines(path)
  local lines = {}
  local f = io.open(path, "r")
  if not f then
    vim.notify("ascii.lua: could not open " .. path, vim.log.levels.WARN)
    return lines
  end
  for line in f:lines() do
    table.insert(lines, line)
  end
  f:close()
  return lines
end

local base = vim.fn.stdpath("config") .. "/lua/config/art/"

local title = read_lines(base .. "title.txt")

local image_files = vim.fn.glob(base .. "images/*.txt", false, true)
local images = {}
for _, path in ipairs(image_files) do
  table.insert(images, read_lines(path))
end

local quotes = read_lines(base .. "quotes.txt")

return {
  title = title,
  image = random_element(images),
  quote = random_element(quotes),
}
