TGL_TARGETS = tgl.fst
TGL_CLEAN_TARGETS = tgl_clean

.PHONY: ase2tgl $(TGL_CLEAN_TARGETS)

ase2tgl: $(SRC_DATA_ROOT)/tgl/*.ini  $(SRC_DATA_ROOT)/tgl/*.ase
	./aseconv -prefix-path $(SRC_DATA_ROOT)/tgl/ -dst-path $(SRC_DATA_ROOT)/tgl/

tgl.rsp: ase2tgl
	./makersp -rsp tgl.rsp -p $(SRC_DATA_ROOT) -w tgl/*.tgl -w tgl/*.agl -w tgl/128/*.tga -w tgl/*.ini

tgl.fst: tgl.rsp
	./makefst -f tgl.fst -p $(SRC_DATA_ROOT) -rsp tgl.rsp -m data

tgl_clean:
	$(RM) $(SRC_DATA_ROOT)$(PATH_SEPARATOR)tgl$(PATH_SEPARATOR)*.agl
	$(RM) $(SRC_DATA_ROOT)$(PATH_SEPARATOR)tgl$(PATH_SEPARATOR)*.tgl
	$(RM) tgl.rsp
	$(RM) tgl.fst


#all: $(TGL_TARGETS)

ALL_TARGETS += $(TGL_TARGETS)
ALL_CLEAN_TARGETS += $(TGL_CLEAN_TARGETS)

