.PHOPY: get-mdbook-version
get-mdbook-version:
	@cat ./deps/Cargo.toml | grep 'mdbook = ' | awk '{print $$3}' | tr -d '"'


get-mdbook-catppuccin-version:
	@cat ./deps/Cargo.toml | grep 'mdbook-catppuccin = ' | awk '{print $$3}' | tr -d '"'
