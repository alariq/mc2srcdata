SOUNDS_INPUT = ..$(PATH_SEPARATOR)sound
SOUNDS_OUTPUT = $(DST_DATA_ROOT)$(PATH_SEPARATOR)sound

SOUND_TARGETS = pilota.pak pilotb.pak pilotc.pak pilotd.pak pilote.pak pilotf.pak pilotg.pak piloth.pak piloti.pak pilotj.pak pilotk.pak pilotl.pak pilotm.pak pilotn.pak piloto.pak pilotp.pak pilotq.pak pilotr.pak pilots.pak pilott.pak pilotu.pak pilotv.pak pilotw.pak pilotx.pak piloty.pak pilotz.pak pilot1a.pak pilot1b.pak pilot1c.pak pilot1d.pak betty.pak sound.pak support.pak

SOUND_CLEAN_TARGETS = $(addprefix $(SOUNDS_OUTPUT)$(PATH_SEPARATOR), $(SOUND_TARGETS))

SRC_WAV_FILES = $(wildcard $(addprefix $(SOUNDS_INPUT)/, tut*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, mc2_*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, music*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, v*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, w*.wav))

DST_WAV_FILES := $(patsubst $(SOUNDS_INPUT)%, $(SOUNDS_OUTPUT)%, $(SRC_WAV_FILES))

# will essentially do nothing if PATH_SEPARATOR = /
DST_WAV_FILES := $(subst /,$(PATH_SEPARATOR),$(DST_WAV_FILES))

ALL_SOUND_TARGETS = $(SOUND_TARGETS)
ALL_SOUND_TARGETS += $(DST_WAV_FILES)


.PHONY: sounds_clean

sounds_clean:
	$(RM) $(DST_WAV_FILES)
	$(RM) $(SOUND_CLEAN_TARGETS)
	$(RMDIR) $(SOUNDS_OUTPUT)

$(SOUNDS_OUTPUT):
	$(MKDIR) $(SOUNDS_OUTPUT)

print_target:
	echo $(DST_WAV_FILES)
	echo $(ALL_SOUND_TARGETS)

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(SOUNDS_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.wav: $(SOUNDS_INPUT)$(PATH_SEPARATOR)%.wav
	$(COPY)  $< $@

$(ALL_SOUND_TARGETS) : | $(SOUNDS_OUTPUT)

# could use this shortcut, but somebody though that it was a good idea to name packs fifferently from source rps files!
#%.pak : %.rsp
#	./pak -f $@ -r $(SOUNDS_INPUT)/$<

pilota.pak: $(SOUNDS_INPUT)/pilot1.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotb.pak: $(SOUNDS_INPUT)/pilot2.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotc.pak: $(SOUNDS_INPUT)/pilot3.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotd.pak: $(SOUNDS_INPUT)/pilot4.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilote.pak: $(SOUNDS_INPUT)/pilot5.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotf.pak: $(SOUNDS_INPUT)/pilot6.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotg.pak: $(SOUNDS_INPUT)/pilot7.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

piloth.pak: $(SOUNDS_INPUT)/pilot8.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

piloti.pak: $(SOUNDS_INPUT)/pilot9.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotj.pak: $(SOUNDS_INPUT)/pilot10.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotk.pak: $(SOUNDS_INPUT)/pilot11.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotl.pak: $(SOUNDS_INPUT)/pilot12.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotm.pak: $(SOUNDS_INPUT)/pilot13.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotn.pak: $(SOUNDS_INPUT)/pilot14.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

piloto.pak: $(SOUNDS_INPUT)/pilot15.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotp.pak: $(SOUNDS_INPUT)/pilot16.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotq.pak: $(SOUNDS_INPUT)/pilot17.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotr.pak: $(SOUNDS_INPUT)/pilot18.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilots.pak: $(SOUNDS_INPUT)/pilot19.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilott.pak: $(SOUNDS_INPUT)/pilot20.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotu.pak: $(SOUNDS_INPUT)/pilot21.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotv.pak: $(SOUNDS_INPUT)/pilot22.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotw.pak: $(SOUNDS_INPUT)/pilot23.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotx.pak: $(SOUNDS_INPUT)/pilot24.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

piloty.pak: $(SOUNDS_INPUT)/pilot25.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilotz.pak: $(SOUNDS_INPUT)/pilot26.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilot1a.pak: $(SOUNDS_INPUT)/pilota.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilot1b.pak: $(SOUNDS_INPUT)/pilotb.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilot1c.pak: $(SOUNDS_INPUT)/pilotc.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

pilot1d.pak: $(SOUNDS_INPUT)/pilotd.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

betty.pak: $(SOUNDS_INPUT)/betty.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

sound.pak: $(SOUNDS_INPUT)/sound.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

support.pak: $(SOUNDS_INPUT)/support.rsp
	./pak -f $(SOUNDS_OUTPUT)/$@ -r $<

#all: $(ALL_SOUND_TARGETS)

ALL_TARGETS += $(ALL_SOUND_TARGETS)
ALL_CLEAN_TARGETS += sounds_clean
