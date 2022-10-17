local discordia = require("discordia")
local round = discordia.extensions.math.round

local function statsCommand(msg, args, meta)
  local memory = round(process.memoryUsage().heapUsed / 1024 / 1024, 2)
  local format = ""

  local function add(line, ...)
    format = format .. string.format(line, ...) .. "\n"
  end

  add("= Bot Statistics =")
  add("")
  add("• Memory Usage      :: %s MB", memory)
  add("• Operating System  :: %s", jit.os)
  add("• Arch              :: %s", jit.arch)
  add("• luvi version      :: %s", require("luvi").version)
  add("• LuaJIT version    :: %s", jit.version)
  add("• Discordia version :: %s", discordia.package.version)

  msg:reply(string.format("```asciidoc\n%s```", format))
end

return {
  run = statsCommand
}
