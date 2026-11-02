# Renders docs/demo.gif with charmbracelet/vhs (needs vhs, ttyd and ffmpeg on PATH).
# Run from the repo root, with the deps installed in .venv:  vhs docs/demo.tape
# Follows DEMO.md: questions + policies -> autopilot drafts answers with local Ollama -> review report (xlsx view replaced by the report).
Output docs/demo.gif

Set Shell "bash"
Set FontSize 18
Set Width 1200
Set Height 700
Set Padding 24
Set Theme "Catppuccin Mocha"
Set WindowBar Colorful
Set TypingSpeed 40ms

Hide
Type "VIRTUAL_ENV_DISABLE_PROMPT=1 source .venv/bin/activate"
Enter
Wait@120s
Type "make clean >/dev/null"
Enter
Wait@120s
Type `curl -s localhost:11434/api/generate -d '{"model":"qwen3:30b-a3b-instruct-2507-q4_K_M","keep_alive":"10m"}' >/dev/null`
Enter
Wait@120s
Type "clear"
Enter
Wait@120s
Show
Sleep 500ms

Type "head -6 input/questions.csv"
Sleep 400ms
Enter
Wait@120s
Sleep 2.5s

Type "ls policies/"
Sleep 400ms
Enter
Wait@120s
Sleep 2s

Hide
Type "clear"
Enter
Sleep 200ms
Show
Type "python autopilot.py"
Sleep 400ms
Enter
Wait@120s
Sleep 3s

Hide
Type "clear"
Enter
Sleep 200ms
Show
Type "cut -c1-100 output/review-report.md"
Sleep 400ms
Enter
Wait@120s
Sleep 5s

Sleep 1s
