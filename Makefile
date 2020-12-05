DAT = $(shell date +%Y-%m-%d-%H%M)
TGT = $(shell basename ${PWD})
MD = $(shell find content -name '*.md')
TMP = $(MD:content%=docs%)
TMP2 = $(TMP:.md=.html)
HTML = $(shell echo $(TMP2) | sed 's/_index/index/g')
PDFurl = $(shell gawk '$$3~/localhost/' config.toml)
PDFpid = $(shell ps -ef | gawk '/http.server/ && !/grep/ {print $$2}')
HUGOpid = $(shell ps -ef | gawk '/hugo server/ && !/grep/ {print $$2}')
HDIR=${HOME}/BQ/github/
BU_DIR = /mnt/DATA/BeeQueen/BACKUPS/hugo

help:
	@echo "Usage:"
	@echo "   make build"
	@echo "   make serve"
	@echo "   make noserve"
	@echo "   make clean"
	@echo "   make bu"
	@echo "   make deploy"

build:
	hugo -D -v
	@for h in $(HTML); do sed '/^$$/d' -i $$h; done

clean:
	rm -r ${HDIR}/hugo/docs

serve:
ifneq ($(PDFurl),)
	cd ${HDIR}/pdf/docs && python3 -m http.server &
endif
	hugo server -w &

noserve:
ifneq ($(PDFpid), )
	kill $(PDFpid)
endif
ifneq ($(HUGOpid), )
	kill $(HUGOpid)
endif

bu:
	tar -cvJf $(BU_DIR)/BQ_$(TGT)_$(DAT).tar.xz \
	    --exclude $(TGT)/.git/objects \
	    --exclude $(TGT)/.git/logs \
	    ../$(TGT)

deploy:
	make clean
	make build
	git add *
	git commit -m "màj $(DAT)"
	git push
	git archive --format=tar.gz -o $(BU_DIR)/BQ_$(TGT)_master_$(DAT).tar.gz master
