OTHER_INPUT = ..$(PATH_SEPARATOR)root
OTHER_OUTPUT = $(DST_DATA_ROOT)$(PATH_SEPARATOR)..

#TODO add *pref.cfg (any others?) here

SRC_OTHER_FILES := $(OTHER_INPUT)$(PATH_SEPARATOR)testtxm.tga $(wildcard $(addprefix $(OTHER_INPUT)/, *.cfg))
DST_OTHER_FILES := $(patsubst $(OTHER_INPUT)%, $(OTHER_OUTPUT)%, $(SRC_OTHER_FILES))

# will essentially do nothing if PATH_SEPARATOR = /
DST_OTHER_FILES := $(subst /,$(PATH_SEPARATOR),$(DST_OTHER_FILES))

ALL_OTHER_TARGETS = $(DST_OTHER_FILES)

.PHONY: other_clean

print_other_target:
	echo $(SRC_OTHER_FILES)
	echo $(DST_OTHER_FILES)


ifeq ($(BUILD_PLATFORM), linux)

$(SOUNDS_OUTPUT)$(PATH_SEPARATOR)%.wav: $(SOUNDS_INPUT)$(PATH_SEPARATOR)%.wav
	$(COPY)  $< $@

else

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(SOUNDS_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.wav: $(SOUNDS_INPUT)$(PATH_SEPARATOR)%.wav
	$(COPY)  $< $@

endif

$(ALL_SOUND_TARGETS) : | $(SOUNDS_OUTPUT)

other_clean:
	$(RM) $(DST_OTHER_FILES)

ifeq ($(BUILD_PLATFORM), linux)

$(OTHER_OUTPUT)%.tga: $(OTHER_INPUT)%.tga
	$(COPY)  $< $@

$(OTHER_OUTPUT)%.cfg: $(OTHER_INPUT)%.cfg
	$(COPY)  $< $@

else

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(OTHER_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.tga: $(OTHER_INPUT)$(PATH_SEPARATOR)%.tga
	$(COPY)  $< $@

$(OTHER_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.cfg: $(OTHER_INPUT)$(PATH_SEPARATOR)%.cfg
	$(COPY)  $< $@

endif

ALL_TARGETS += $(ALL_OTHER_TARGETS)
ALL_CLEAN_TARGETS += other_clean
