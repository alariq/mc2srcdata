art.fst:
	./makefst -f art.fst -p ../art/ -m data/art

mission.fst:
	./makefst -f mission.fst -p ../missions/ -m data/missions

camera.fst:
	./makefst -f camera.fst -p ../cameras/ -m data/cameras

effect.fst:
	./makefst -f effect.fst -p ../effects/ -m data/effects

insignia.fst:
	./makefst -f insignia.fst -p ../multiplayer/insignia/ -m data/multiplayer/insignia

misc.fst: ../misc.rsp
	./makefst -f misc.fst -p .. -rsp ../misc.rsp -m data

textures.fst:
	./makefst -f textures.fst -p ../textures/ -m data/textures

tgl.fst: # actually neds to excude 'arm' folder
	./makefst -f tgl.fst -p ../tgl/ -m data/tgl

all: art.fst mission.fst camera.fst effect.fst insignia.fst misc.fst textures.fst tgl.fst makefst

