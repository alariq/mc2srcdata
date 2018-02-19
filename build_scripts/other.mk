OTHER_INPUT = ..$(PATH_SEPARATOR)root
OTHER_OUTPUT = $(DST_DATA_ROOT)$(PATH_SEPARATOR)..

#TODO add *pref.cfg (any others?) here
SRC_OTHER_FILES = $(OTHER_INPUT)$(PATH_SEPARATOR)testtxm.tga
DST_OTHER_FILES := $(OTHER_OUTPUT)$(PATH_SEPARATOR)testtxm.tga

# will essentially do nothing if PATH_SEPARATOR = /
DST_OTHER_FILES := $(subst /,$(PATH_SEPARATOR),$(DST_OTHER_FILES))

ALL_OTHER_TARGETS = $(DST_OTHER_FILES)

.PHONY: other_clean

other_clean:
	$(RM) $(DST_OTHER_FILES)

ifeq ($(BUILD_PLATFORM), linux)

$(OTHER_OUTPUT)%.tga: $(OTHER_INPUT)%.tga
	$(COPY)  $< $@

else

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(OTHER_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.tga: $(OTHER_INPUT)$(PATH_SEPARATOR)%.tga
	$(COPY)  $< $@

endif

ALL_TARGETS += $(ALL_OTHER_TARGETS)
ALL_CLEAN_TARGETS += other_clean
