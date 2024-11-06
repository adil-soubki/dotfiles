all:
	ln -sfnv $$(find . -depth 2 -not -wholename "./.git*" | xargs realpath) $$HOME

clean:
	rm -i $$(find $$HOME -depth 1 -type l -exec readlink -nf {} ';' -exec echo " <- {}" ';' 2>&1 | grep -v 'Operation not permitted' | sed -nE 's/.* <- (.*)/\1/p')
