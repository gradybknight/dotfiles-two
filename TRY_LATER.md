[use aerospace to bind keystroke to screen layout](https://chatgpt.com/share/676446e2-d868-8003-891e-03068189afdf)
```toml
# Define a custom command to set up the desired layout
[[commands]]
name = "setup_kmt_workspace"
run = '''
aerospace workspace new kmt
aerospace exec "open -na Alacritty"
aerospace exec "open -na Slack"
aerospace exec "open -na Safari"
sleep 1  # Wait for applications to launch
aerospace focus "Alacritty"
aerospace move --resize 0.5 1.0
aerospace focus "Slack"
aerospace move --resize 0.25 1.0
aerospace focus "Safari"
aerospace move --resize 0.25 1.0
aerospace move --to-position 0.0 0.0
'''

# Bind the custom command to a key combination
[[keybindings]]
key = "C-k"
command = "setup_kmt_workspace"
```

then
```bash
aerospace reload-config
```

this is bound to `Ctrl + K`
