FST_TARGETS = art.fst mission.fst camera.fst effect.fst insignia.fst misc.fst textures.fst tgl.fst

art.fst:
	./makefst -f art.fst -p $(SRC_DATA_ROOT)/art/ -m data/art

mission.fst: $(SRC_DATA_ROOT)/missions.rsp
	./makefst -f mission.fst -p $(SRC_DATA_ROOT) -rsp $(SRC_DATA_ROOT)/missions.rsp -m data

camera.fst:
	./makefst -f camera.fst -p $(SRC_DATA_ROOT)/cameras/ -m data/cameras

effect.fst:
	./makefst -f effect.fst -p $(SRC_DATA_ROOT)/effects/ -m data/effects

insignia.fst:
	./makefst -f insignia.fst -p $(SRC_DATA_ROOT)/multiplayer/insignia/ -m data/multiplayer/insignia

misc.fst: ../misc.rsp
	./makefst -f misc.fst -p $(SRC_DATA_ROOT) -rsp $(SRC_DATA_ROOT)/misc.rsp -m data

textures.fst:
	./makefst -f textures.fst -p $(SRC_DATA_ROOT)/textures/ -m data/textures

tgl.fst: # actually needs to exclude 'arm' folder
	./makefst -f tgl.fst -p $(SRC_DATA_ROOT)/tgl/ -m data/tgl


ALL_TARGETS = $(FST_TARGETS)

