PROJ=9cc
SCRIPT=test.sh
9CC_SRC=$(PROJ).c
9CC_EXE=$(PROJ)
TAR_SRC=target.s
TAR_EXE=target

.SILENT:

all: $(TAR_EXE)

$(9CC_EXE): $(9CC_SRC)
	gcc $? -o $@

$(TAR_SRC): $(9CC_EXE)
	./$? $(ARG) > $@

$(TAR_EXE): $(TAR_SRC)
	gcc $? -o $@

test: $(SCRIPT)
	./$(SCRIPT)

clean:
	rm -f $(9CC_EXE) $(TAR_SRC) $(TAR_EXE)
