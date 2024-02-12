install:
	@echo "Installing dotfiles..."
	@echo "config -> ~/.config"
	stow -R -t ~/.config/ config -v
	@echo "\nlocal -> ~/.local"
	stow -R -t ~/.local/ local -v

.PHONY: install
