install:
	stow -R -t ~/.config/ config -v
	stow -R -t ~/.local/ local -v

.PHONY: install
