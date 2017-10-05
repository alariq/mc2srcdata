MOVIE_INPUT = ..$(PATH_SEPARATOR)movies
MOVIE_OUTPUT = $(DST_DATA_ROOT)$(PATH_SEPARATOR)movies

SRC_MOVIE_FILES = $(wildcard $(addprefix $(MOVIE_INPUT)/, *.tga))
DST_MOVIE_FILES := $(patsubst $(MOVIE_INPUT)%, $(MOVIE_OUTPUT)%, $(SRC_MOVIE_FILES))

# will essentially do nothing if PATH_SEPARATOR = /
DST_MOVIE_FILES := $(subst /,$(PATH_SEPARATOR),$(DST_MOVIE_FILES))

ALL_MOVIE_TARGETS = $(DST_MOVIE_FILES)

.PHONY: movie_clean

movie_clean:
	$(RM) $(DST_MOVIE_FILES)
	$(RMDIR) $(MOVIE_OUTPUT)

$(MOVIE_OUTPUT):
	$(MKDIR) $(MOVIE_OUTPUT)

ifeq ($(BUILD_PLATFORM), linux)

$(MOVIE_OUTPUT)$(PATH_SEPARATOR)%.tga: $(MOVIE_INPUT)$(PATH_SEPARATOR)%.tga
	$(COPY)  $< $@

else

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(MOVIE_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.tga: $(MOVIE_INPUT)$(PATH_SEPARATOR)%.tga
	$(COPY)  $< $@

endif

$(ALL_MOVIE_TARGETS) : | $(MOVIE_OUTPUT)

ALL_TARGETS += $(ALL_MOVIE_TARGETS)
ALL_CLEAN_TARGETS += movie_clean
