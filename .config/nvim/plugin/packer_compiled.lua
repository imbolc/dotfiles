-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/imbolc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/imbolc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/imbolc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/imbolc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/imbolc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\ny\0\0\3\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\2'\1\5\0=\1\4\0'\1\a\0=\1\6\0K\0\1\0\n// %s\njson5\f<%#%s%>\rsailfish\15Comment.ft\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Vim-Jinja2-Syntax"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/Vim-Jinja2-Syntax",
    url = "https://github.com/Glench/Vim-Jinja2-Syntax"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["crates.nvim"] = {
    after_files = { "/home/imbolc/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["edgedb-vim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/edgedb-vim",
    url = "https://github.com/edgedb/edgedb-vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["eink.vim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/eink.vim",
    url = "https://github.com/clinstid/eink.vim"
  },
  ["fidget.nvim"] = {
    config = { "require'fidget'.setup{}" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\b\1\n\0\0226\0\0\0009\0\1\0-\2\0\0'\3\2\0B\0\3\0016\0\0\0009\0\1\0-\2\0\0006\3\3\0009\3\4\0039\3\5\0036\5\3\0009\5\6\0059\5\a\5)\a\0\0B\5\2\0A\3\0\0A\0\1\0015\0\b\0-\1\0\0=\1\t\0L\0\2\0\0À\targs\1\0\2\bexe\rprettier\nstdin\2\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\21--stdin-filepath\vinsert\ntable&\3\0\2\0\1\1\0064\0\3\0G\1\0\0?\1\0\0003\1\0\0002\0\0€L\1\2\0\0\3€€À™\0046\0\0\2\2\3\0\0065\0\0\0-\1\0\0=\1\1\0-\1\1\0=\1\2\0L\0\2\0\0À\1À\targs\bexe\1\0\1\nstdin\2&\3\1\3\0\1\1\0064\1\3\0G\2\1\0?\2\0\0003\2\0\0002\0\0€L\2\2\0\0\3€€À™\4ˆ\6\1\0\r\0\"\2^3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\28\0005\5\5\0004\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\6\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\a\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\b\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\t\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\n\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\v\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\f\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\r\0054\6\3\0\18\a\1\0'\t\14\0'\n\15\0B\a\3\0?\a\0\0=\6\16\0054\6\3\0\18\a\1\0'\t\17\0'\n\18\0'\v\19\0B\a\4\0?\a\0\0=\6\20\0054\6\3\0\18\a\1\0'\t\21\0'\n\22\0'\v\15\0B\a\4\0?\a\0\0=\6\23\0054\6\3\0\18\a\1\0'\t\24\0'\n\25\0'\v\26\0'\f\15\0B\a\5\2>\a\1\6\18\a\1\0'\t\26\0'\n\15\0B\a\3\0?\a\1\0=\6\27\5=\5\29\4B\2\2\0016\2\30\0009\2\31\0029\2 \2'\4!\0+\5\2\0B\2\3\1K\0\1\0­\1\t               augroup FormatAutogroup\n\t               autocmd!\n\t               autocmd BufWritePost * silent! FormatWrite\n\t               augroup END\n\t               \14nvim_exec\bapi\bvim\rfiletype\1\0\0\vpython\nblack\14--profile\nisort\ttoml\bfmt\ntaplo\trust\19--edition=2021\18--emit=stdout\frustfmt\blua\6-\vstylua\15javascript\15typescript\vsvelte\bvue\bcss\tyaml\njson5\tjson\1\0\0\nsetup\14formatter\frequire\0\0\3€€À™\4\5€€À™\4\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["json5.vim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/json5.vim",
    url = "https://github.com/GutenYe/json5.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nÏ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\15\0\0\vbashls\ncssls\vjsonls\vlua_ls\rmarksman\fpyright\18quick_lint_js\18rust_analyzer\nsqlls\vsvelte\ntaplo\nvolar\nvuels\vyamlls\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÍ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\5À\1À\0À\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\5À\1À\tjump\rjumpable\21select_prev_item\fvisible'\0\1\3\1\1\0\6-\1\0\0009\1\0\1B\1\1\1\18\1\0\0B\1\1\1K\0\1\0\5À\nclose‰\n\1\0\15\0=\1…\0013\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\0019\3\4\0019\4\5\1\18\5\2\0'\a\6\0004\b\4\0\18\t\3\0'\v\a\0B\t\2\2>\t\1\b\18\t\4\0)\v\1\0B\t\2\2>\t\2\b\18\t\3\0'\v\b\0B\t\2\0?\t\0\0B\5\3\0016\5\1\0'\a\t\0B\5\2\0029\6\n\0055\b\14\0005\t\f\0003\n\v\0=\n\r\t=\t\3\b5\t\18\0009\n\15\0053\f\16\0005\r\17\0B\n\3\2=\n\19\t9\n\15\0053\f\20\0005\r\21\0B\n\3\2=\n\22\t9\n\15\0059\n\23\nB\n\1\2=\n\24\t9\n\15\0053\f\25\0B\n\2\2=\n\26\t=\t\15\b4\t\a\0005\n\27\0>\n\1\t5\n\28\0>\n\2\t5\n\29\0>\n\3\t5\n\30\0>\n\4\t5\n\31\0>\n\5\t5\n \0>\n\6\t=\t!\b5\t\"\0=\t#\b5\t)\0006\n\1\0'\f$\0B\n\2\0029\n%\n5\f&\0005\r'\0=\r(\fB\n\2\2=\n*\t=\t+\bB\6\2\0019\6\n\0059\6,\6'\b-\0005\t1\0009\n.\0059\n!\n4\f\3\0005\r/\0>\r\1\f4\r\3\0005\0140\0>\14\1\rB\n\3\2=\n!\t5\n2\0=\n#\tB\6\3\0019\6\n\0059\6,\6'\b3\0005\t6\0009\n.\0059\n!\n4\f\3\0005\r4\0>\r\1\f4\r\3\0005\0145\0>\14\1\rB\n\3\2=\n!\t5\n7\0=\n#\tB\6\3\0019\6\n\0059\6,\6'\b8\0005\t;\0009\n.\0059\n!\n4\f\3\0005\r9\0>\r\1\f4\r\3\0005\14:\0>\14\1\rB\n\3\2=\n!\t5\n<\0=\n#\tB\6\3\0012\0\0€K\0\1\0\1\0\1\16completeopt\26menu,menuone,noselect\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\1\16completeopt\26menu,menuone,noselect\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\6?\1\0\1\16completeopt\26menu,menuone,noselect\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\vconfig\6/\fcmdline\15formatting\vformat\1\0\0\tmenu\1\0\5\rnvim_lsp\bLSP\18latex_symbols\nLatex\rnvim_lua\bLua\vbuffer\vBuffer\fluasnip\fLuaSnip\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\flspkind\15completion\1\0\1\16completeopt\26menu,menuone,noselect\fsources\1\0\1\tname\tcalc\1\0\1\tname\rnvim_lua\1\0\1\tname\tpath\1\0\2\19keyword_length\3\4\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<ESC>\0\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\6}\20if err != nil {\niferr\16insert_node\14text_node\fsnippet\fluasnip\frequire\0\a€€À™\4\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimô\b\1\2\n\0%\0`3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\5\0'\b\6\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\t\0'\b\n\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\v\0'\b\f\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\19\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\25\0'\b\26\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\27\0'\b\28\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\29\0'\b\30\0\18\t\3\0B\4\5\0016\4\31\0'\6 \0B\4\2\0029\4!\0045\6\"\0005\a#\0=\a$\6B\4\2\0012\0\0€K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\3\14doc_lines\3\0\vzindex\0032\16hint_enable\1\14on_attach\18lsp_signature\frequire*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f.<cmd>lua vim.diagnostic.set_loclist()<CR>\r<space>q,<cmd>lua vim.diagnostic.goto_next()<CR>\a]d,<cmd>lua vim.diagnostic.goto_prev()<CR>\a[d-<cmd>lua vim.diagnostic.open_float()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\r<space>a&<cmd>lua vim.lsp.buf.rename()<CR>\r<space>r/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>D.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\0ö\5\1\0\n\0/\0J6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\5\0039\3\6\0035\4\a\0B\1\3\2=\1\3\0003\0\b\0006\1\t\0'\3\n\0B\1\2\0029\1\v\1B\1\1\0026\2\t\0'\4\f\0B\2\2\0029\3\r\0029\3\14\0035\5\15\0=\0\16\0055\6\17\0=\6\18\0055\6\26\0005\a\20\0005\b\19\0=\b\21\a5\b\23\0005\t\22\0=\t\24\b=\b\25\a=\a\27\6=\6\28\5=\1\29\5B\3\2\0019\3\30\0029\3\14\0035\5\31\0=\0\16\0055\6%\0005\a#\0005\b!\0005\t \0=\t\"\b=\b$\a=\a&\6=\6\28\5B\3\2\0019\3'\0029\3\14\0035\5(\0=\0\16\5B\3\2\0019\3)\0029\3\14\0035\5*\0=\0\16\5B\3\2\0019\3+\0029\3\14\0035\5,\0=\0\16\5B\3\2\0019\3-\0029\3\14\0035\5.\0=\0\16\5B\3\2\1K\0\1\0\1\0\0\nvuels\1\0\0\18quick_lint_js\1\0\0\fpyright\1\0\0\rmarksman\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\3\0\0\bvim\frequire\1\0\0\vlua_ls\17capabilities\rsettings\18rust-analyzer\1\0\0\15completion\fpostfix\1\0\0\1\0\1\venable\1\ncargo\1\0\0\1\0\1\16allFeatures\2\nflags\1\0\1\26debounce_text_changes\3–\1\14on_attach\1\0\0\nsetup\18rust_analyzer\14lspconfig\25default_capabilities\17cmp_nvim_lsp\frequire\0\1\0\3\21update_in_insert\2\nsigns\2\17virtual_text\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nð\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\21\0\0\tbash\fcomment\bcss\thtml\15javascript\tjson\njson5\blua\rmarkdown\20markdown_inline\vpython\trust\vsvelte\ttoml\15typescript\bvue\tyaml\nquery\tscss\bsql\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme PaperColor\bcmd\bvim\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  playground = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rainbow_csv = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/rainbow_csv",
    url = "https://github.com/mechatroner/rainbow_csv"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  sailfish = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/sailfish/syntax/vim",
    url = "https://github.com/rust-sailfish/sailfish"
  },
  ["sqlx-rs.nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/sqlx-rs.nvim",
    url = "https://github.com/Xuyuanp/sqlx-rs.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n·\2\0\0\t\0\21\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\r\0005\5\5\0005\6\4\0=\6\6\0055\6\n\0005\a\b\0009\b\a\1=\b\t\a=\a\v\6=\6\f\5=\5\14\0045\5\16\0005\6\15\0=\6\17\5=\5\18\4B\2\2\0019\2\19\0'\4\17\0B\2\2\0019\2\19\0'\4\20\0B\2\2\1K\0\1\0\vpacker\19load_extension\15extensions\bfzf\1\0\0\1\0\1\nfuzzy\2\rdefaults\1\0\0\rmappings\6i\1\0\0\t<cr>\1\0\0\15select_tab\25file_ignore_patterns\1\0\0\1\3\0\0\n%.git\17node_modules\nsetup\22telescope.actions\14telescope\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-bracketed-paste"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-bracketed-paste",
    url = "https://github.com/ConradIrwin/vim-bracketed-paste"
  },
  ["vim-markdown"] = {
    config = { '\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"vim_markdown_folding_disabled\6g\bvim\0' },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-slash"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-slash",
    url = "https://github.com/junegunn/vim-slash"
  },
  ["vim-svelte"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-svelte",
    url = "https://github.com/evanleck/vim-svelte"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vue"] = {
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/vim-vue",
    url = "https://github.com/posva/vim-vue"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nwidth\3P\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/imbolc/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/home/imbolc/.local/share/nvim/site/pack/packer/start/sailfish/syntax/vim"
time([[Runtimepath customization]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\ny\0\0\3\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\2'\1\5\0=\1\4\0'\1\a\0=\1\6\0K\0\1\0\n// %s\njson5\f<%#%s%>\rsailfish\15Comment.ft\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nð\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\21\0\0\tbash\fcomment\bcss\thtml\15javascript\tjson\njson5\blua\rmarkdown\20markdown_inline\vpython\trust\vsvelte\ttoml\15typescript\bvue\tyaml\nquery\tscss\bsql\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÍ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\19€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\n€-\1\2\0B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\4\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\5À\1À\0À\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\5À\1À\tjump\rjumpable\21select_prev_item\fvisible'\0\1\3\1\1\0\6-\1\0\0009\1\0\1B\1\1\1\18\1\0\0B\1\1\1K\0\1\0\5À\nclose‰\n\1\0\15\0=\1…\0013\0\0\0006\1\1\0'\3\2\0B\1\2\0029\2\3\0019\3\4\0019\4\5\1\18\5\2\0'\a\6\0004\b\4\0\18\t\3\0'\v\a\0B\t\2\2>\t\1\b\18\t\4\0)\v\1\0B\t\2\2>\t\2\b\18\t\3\0'\v\b\0B\t\2\0?\t\0\0B\5\3\0016\5\1\0'\a\t\0B\5\2\0029\6\n\0055\b\14\0005\t\f\0003\n\v\0=\n\r\t=\t\3\b5\t\18\0009\n\15\0053\f\16\0005\r\17\0B\n\3\2=\n\19\t9\n\15\0053\f\20\0005\r\21\0B\n\3\2=\n\22\t9\n\15\0059\n\23\nB\n\1\2=\n\24\t9\n\15\0053\f\25\0B\n\2\2=\n\26\t=\t\15\b4\t\a\0005\n\27\0>\n\1\t5\n\28\0>\n\2\t5\n\29\0>\n\3\t5\n\30\0>\n\4\t5\n\31\0>\n\5\t5\n \0>\n\6\t=\t!\b5\t\"\0=\t#\b5\t)\0006\n\1\0'\f$\0B\n\2\0029\n%\n5\f&\0005\r'\0=\r(\fB\n\2\2=\n*\t=\t+\bB\6\2\0019\6\n\0059\6,\6'\b-\0005\t1\0009\n.\0059\n!\n4\f\3\0005\r/\0>\r\1\f4\r\3\0005\0140\0>\14\1\rB\n\3\2=\n!\t5\n2\0=\n#\tB\6\3\0019\6\n\0059\6,\6'\b3\0005\t6\0009\n.\0059\n!\n4\f\3\0005\r4\0>\r\1\f4\r\3\0005\0145\0>\14\1\rB\n\3\2=\n!\t5\n7\0=\n#\tB\6\3\0019\6\n\0059\6,\6'\b8\0005\t;\0009\n.\0059\n!\n4\f\3\0005\r9\0>\r\1\f4\r\3\0005\14:\0>\14\1\rB\n\3\2=\n!\t5\n<\0=\n#\tB\6\3\0012\0\0€K\0\1\0\1\0\1\16completeopt\26menu,menuone,noselect\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\1\16completeopt\26menu,menuone,noselect\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\6?\1\0\1\16completeopt\26menu,menuone,noselect\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\vconfig\6/\fcmdline\15formatting\vformat\1\0\0\tmenu\1\0\5\rnvim_lsp\bLSP\18latex_symbols\nLatex\rnvim_lua\bLua\vbuffer\vBuffer\fluasnip\fLuaSnip\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\flspkind\15completion\1\0\1\16completeopt\26menu,menuone,noselect\fsources\1\0\1\tname\tcalc\1\0\1\tname\rnvim_lua\1\0\1\tname\tpath\1\0\2\19keyword_length\3\4\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<ESC>\0\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\6}\20if err != nil {\niferr\16insert_node\14text_node\fsnippet\fluasnip\frequire\0\a€€À™\4\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
require'fidget'.setup{}
time([[Config for fidget.nvim]], false)
-- Config for: papercolor-theme
time([[Config for papercolor-theme]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme PaperColor\bcmd\bvim\0", "config", "papercolor-theme")
time([[Config for papercolor-theme]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1À\24nvim_buf_set_keymap\bapi\bvimô\b\1\2\n\0%\0`3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\5\0'\b\6\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\t\0'\b\n\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\v\0'\b\f\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\19\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\25\0'\b\26\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\27\0'\b\28\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\29\0'\b\30\0\18\t\3\0B\4\5\0016\4\31\0'\6 \0B\4\2\0029\4!\0045\6\"\0005\a#\0=\a$\6B\4\2\0012\0\0€K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\3\14doc_lines\3\0\vzindex\0032\16hint_enable\1\14on_attach\18lsp_signature\frequire*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f.<cmd>lua vim.diagnostic.set_loclist()<CR>\r<space>q,<cmd>lua vim.diagnostic.goto_next()<CR>\a]d,<cmd>lua vim.diagnostic.goto_prev()<CR>\a[d-<cmd>lua vim.diagnostic.open_float()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\r<space>a&<cmd>lua vim.lsp.buf.rename()<CR>\r<space>r/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>D.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\0ö\5\1\0\n\0/\0J6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\5\0039\3\6\0035\4\a\0B\1\3\2=\1\3\0003\0\b\0006\1\t\0'\3\n\0B\1\2\0029\1\v\1B\1\1\0026\2\t\0'\4\f\0B\2\2\0029\3\r\0029\3\14\0035\5\15\0=\0\16\0055\6\17\0=\6\18\0055\6\26\0005\a\20\0005\b\19\0=\b\21\a5\b\23\0005\t\22\0=\t\24\b=\b\25\a=\a\27\6=\6\28\5=\1\29\5B\3\2\0019\3\30\0029\3\14\0035\5\31\0=\0\16\0055\6%\0005\a#\0005\b!\0005\t \0=\t\"\b=\b$\a=\a&\6=\6\28\5B\3\2\0019\3'\0029\3\14\0035\5(\0=\0\16\5B\3\2\0019\3)\0029\3\14\0035\5*\0=\0\16\5B\3\2\0019\3+\0029\3\14\0035\5,\0=\0\16\5B\3\2\0019\3-\0029\3\14\0035\5.\0=\0\16\5B\3\2\1K\0\1\0\1\0\0\nvuels\1\0\0\18quick_lint_js\1\0\0\fpyright\1\0\0\rmarksman\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\3\0\0\bvim\frequire\1\0\0\vlua_ls\17capabilities\rsettings\18rust-analyzer\1\0\0\15completion\fpostfix\1\0\0\1\0\1\venable\1\ncargo\1\0\0\1\0\1\16allFeatures\2\nflags\1\0\1\26debounce_text_changes\3–\1\14on_attach\1\0\0\nsetup\18rust_analyzer\14lspconfig\25default_capabilities\17cmp_nvim_lsp\frequire\0\1\0\3\21update_in_insert\2\nsigns\2\17virtual_text\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\b\1\n\0\0226\0\0\0009\0\1\0-\2\0\0'\3\2\0B\0\3\0016\0\0\0009\0\1\0-\2\0\0006\3\3\0009\3\4\0039\3\5\0036\5\3\0009\5\6\0059\5\a\5)\a\0\0B\5\2\0A\3\0\0A\0\1\0015\0\b\0-\1\0\0=\1\t\0L\0\2\0\0À\targs\1\0\2\bexe\rprettier\nstdin\2\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\21--stdin-filepath\vinsert\ntable&\3\0\2\0\1\1\0064\0\3\0G\1\0\0?\1\0\0003\1\0\0002\0\0€L\1\2\0\0\3€€À™\0046\0\0\2\2\3\0\0065\0\0\0-\1\0\0=\1\1\0-\1\1\0=\1\2\0L\0\2\0\0À\1À\targs\bexe\1\0\1\nstdin\2&\3\1\3\0\1\1\0064\1\3\0G\2\1\0?\2\0\0003\2\0\0002\0\0€L\2\2\0\0\3€€À™\4ˆ\6\1\0\r\0\"\2^3\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\2\4\0025\4\28\0005\5\5\0004\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\6\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\a\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\b\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\t\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\n\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\v\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\f\0054\6\3\0\18\a\0\0B\a\1\0?\a\0\0=\6\r\0054\6\3\0\18\a\1\0'\t\14\0'\n\15\0B\a\3\0?\a\0\0=\6\16\0054\6\3\0\18\a\1\0'\t\17\0'\n\18\0'\v\19\0B\a\4\0?\a\0\0=\6\20\0054\6\3\0\18\a\1\0'\t\21\0'\n\22\0'\v\15\0B\a\4\0?\a\0\0=\6\23\0054\6\3\0\18\a\1\0'\t\24\0'\n\25\0'\v\26\0'\f\15\0B\a\5\2>\a\1\6\18\a\1\0'\t\26\0'\n\15\0B\a\3\0?\a\1\0=\6\27\5=\5\29\4B\2\2\0016\2\30\0009\2\31\0029\2 \2'\4!\0+\5\2\0B\2\3\1K\0\1\0­\1\t               augroup FormatAutogroup\n\t               autocmd!\n\t               autocmd BufWritePost * silent! FormatWrite\n\t               augroup END\n\t               \14nvim_exec\bapi\bvim\rfiletype\1\0\0\vpython\nblack\14--profile\nisort\ttoml\bfmt\ntaplo\trust\19--edition=2021\18--emit=stdout\frustfmt\blua\6-\vstylua\15javascript\15typescript\vsvelte\bvue\bcss\tyaml\njson5\tjson\1\0\0\nsetup\14formatter\frequire\0\0\3€€À™\4\5€€À™\4\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring('\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"vim_markdown_folding_disabled\6g\bvim\0', "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nwidth\3P\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nÏ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\15\0\0\vbashls\ncssls\vjsonls\vlua_ls\rmarksman\fpyright\18quick_lint_js\18rust_analyzer\nsqlls\vsvelte\ntaplo\nvolar\nvuels\vyamlls\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope-packer.nvim ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
