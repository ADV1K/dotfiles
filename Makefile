install:
	@echo "Installing dotfiles..."
	@echo "#######################"
	@echo "# config -> ~/.config #"
	@echo "#######################"
	stow -R -t ~/.config/ config -v
	@echo "#####################"
	@echo "# local -> ~/.local #"
	@echo "#####################"
	stow -R -t ~/.local/ local -v --adopt

.PHONY: install
