SOUNDS_INPUT = ..$(PATH_SEPARATOR)sound
SOUNDS_OUTPUT = $(DST_DATA_ROOT)$(PATH_SEPARATOR)sound

# see https://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors for changing this to := instead
SOUND_TARGETS = $(addprefix $(SOUNDS_OUTPUT)$(PATH_SEPARATOR), pilota.pak pilotb.pak pilotc.pak pilotd.pak pilote.pak pilotf.pak pilotg.pak piloth.pak piloti.pak pilotj.pak pilotk.pak pilotl.pak pilotm.pak pilotn.pak piloto.pak pilotp.pak pilotq.pak pilotr.pak pilots.pak pilott.pak pilotu.pak pilotv.pak pilotw.pak pilotx.pak piloty.pak pilotz.pak pilot1a.pak pilot1b.pak pilot1c.pak pilot1d.pak betty.pak sound.pak support.pak)

SRC_WAV_FILES = $(wildcard $(addprefix $(SOUNDS_INPUT)/, tut*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, mc2_*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, music*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, v*.wav))
SRC_WAV_FILES += $(wildcard $(addprefix $(SOUNDS_INPUT)/, w*.wav))

DST_WAV_FILES := $(patsubst $(SOUNDS_INPUT)%, $(SOUNDS_OUTPUT)%, $(SRC_WAV_FILES))

# will essentially do nothing if PATH_SEPARATOR = /
DST_WAV_FILES := $(subst /,$(PATH_SEPARATOR),$(DST_WAV_FILES))

SOUND_TARGETS += $(DST_WAV_FILES)

$(SOUNDS_OUTPUT):
	$(MKDIR) $(SOUNDS_OUTPUT)

print_target:
	echo $(DST_WAV_FILES)


ifeq ($(BUILD_PLATFORM), linux)

$(SOUNDS_OUTPUT)$(PATH_SEPARATOR)%.wav: $(SOUNDS_INPUT)$(PATH_SEPARATOR)%.wav
	$(COPY)  $< $@

else

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(SOUNDS_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.wav: $(SOUNDS_INPUT)$(PATH_SEPARATOR)%.wav
	$(COPY)  $< $@

endif


$(SOUND_TARGETS) : | $(SOUNDS_OUTPUT)

# could use this shortcut, but somebody though that it was a good idea to name packs fifferently from source rps files!
#%.pak : %.rsp
#	./pak -f $@ -r $(SOUNDS_INPUT)/$<


$(SOUNDS_OUTPUT)/pilota.pak: $(SOUNDS_INPUT)/pilot1.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotb.pak: $(SOUNDS_INPUT)/pilot2.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotc.pak: $(SOUNDS_INPUT)/pilot3.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotd.pak: $(SOUNDS_INPUT)/pilot4.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilote.pak: $(SOUNDS_INPUT)/pilot5.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotf.pak: $(SOUNDS_INPUT)/pilot6.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotg.pak: $(SOUNDS_INPUT)/pilot7.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/piloth.pak: $(SOUNDS_INPUT)/pilot8.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/piloti.pak: $(SOUNDS_INPUT)/pilot9.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotj.pak: $(SOUNDS_INPUT)/pilot10.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotk.pak: $(SOUNDS_INPUT)/pilot11.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotl.pak: $(SOUNDS_INPUT)/pilot12.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotm.pak: $(SOUNDS_INPUT)/pilot13.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotn.pak: $(SOUNDS_INPUT)/pilot14.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/piloto.pak: $(SOUNDS_INPUT)/pilot15.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotp.pak: $(SOUNDS_INPUT)/pilot16.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotq.pak: $(SOUNDS_INPUT)/pilot17.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotr.pak: $(SOUNDS_INPUT)/pilot18.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilots.pak: $(SOUNDS_INPUT)/pilot19.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilott.pak: $(SOUNDS_INPUT)/pilot20.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotu.pak: $(SOUNDS_INPUT)/pilot21.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotv.pak: $(SOUNDS_INPUT)/pilot22.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotw.pak: $(SOUNDS_INPUT)/pilot23.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotx.pak: $(SOUNDS_INPUT)/pilot24.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/piloty.pak: $(SOUNDS_INPUT)/pilot25.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilotz.pak: $(SOUNDS_INPUT)/pilot26.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilot1a.pak: $(SOUNDS_INPUT)/pilota.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilot1b.pak: $(SOUNDS_INPUT)/pilotb.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilot1c.pak: $(SOUNDS_INPUT)/pilotc.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/pilot1d.pak: $(SOUNDS_INPUT)/pilotd.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/betty.pak: $(SOUNDS_INPUT)/betty.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/sound.pak: $(SOUNDS_INPUT)/sound.rsp
	./pak -f $@ -r $<

$(SOUNDS_OUTPUT)/support.pak: $(SOUNDS_INPUT)/support.rsp
	./pak -f $@ -r $<

#all: $(SOUND_TARGETS) 

ALL_TARGETS += $(SOUND_TARGETS)

# pilot1.pck pilot2 pilot3 pilot4 pilot5 pilot6 pilot7 pilot8 pilot9 pilot9 pilot10 pilot11 pilot12 pilot13 pilot14 pilot15 pilot16 pilot17 pilot17 pilot18 pilot19 pilot20 pilot21 pilot22 pilot23 pilot34 pilot25 pilot26 pilota pilotb pilotc pilotd

