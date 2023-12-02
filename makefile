.PHONY: help lint play check pwd

DEFAULT: help

PWD = $$(pwd)
THEME_DST = "/usr/share/sddm/themes/sddm-dark-chocolate"


help:  ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z0-9_.-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) }' $(MAKEFILE_LIST)
	@echo ""

test: ## Test theme.
	@sddm-greeter --test-mode --theme $(PWD)

install: ## Copy theme to sddm theme folder (requires sudo privileges).
	@sudo $$(which cp) -rf $(PWD) $(THEME_DST)
	@echo -e " >> Copied \033[36m$(PWD)\033[0m to \033[36m$(THEME_DST)\033[0m"


