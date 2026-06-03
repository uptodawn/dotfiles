URL := "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/DejaVuSansMono.zip"
FILE := "DejaVuSansMono.zip"

all:
	@which curl >/dev/null
	@which unzip >/dev/null
	@which fc-cache >/dev/null
	[ -f $(FILE) ] || curl -LJR $(URL) -o $(FILE)
	unzip $(FILE)
	fc-cache -fv

clean:
	rm -f $(FILE)
