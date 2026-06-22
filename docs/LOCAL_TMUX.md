# Local tmux Preview

Run from the repository root:

```bash
vendor/conda-tmux/bin/tmux new-session -d -s alfolio-local 'export PATH="$PWD/vendor/mise-data/installs/ruby/3.3.11/bin:$HOME/Library/Python/3.9/bin:$PATH" && bundle exec jekyll build --baseurl "" && bundle exec jekyll serve --host 127.0.0.1 --port 4000 --baseurl "" --no-watch --skip-initial-build'
```

Open:

```text
http://127.0.0.1:4000/
```

Useful commands:

```bash
vendor/conda-tmux/bin/tmux attach -t alfolio-local
vendor/conda-tmux/bin/tmux kill-session -t alfolio-local
```
