vim.api.nvim_create_user_command('Signal', function(opts)
  local args = {}
  if opts.args and opts.args:match('copy') then
    args.copy = true
  end
  require('signal').signal(args)
end, {
  nargs = '?',
  complete = function()
    return {'copy'}
  end
})
