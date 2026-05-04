MOVIE_INPUT = ..$(PATH_SEPARATOR)movies
MOVIE_OUTPUT = $(DST_DATA_ROOT)$(PATH_SEPARATOR)movies

SRC_MOVIE_FILES = $(wildcard $(addprefix $(MOVIE_INPUT)/, *.tga))
DST_MOVIE_FILES := $(patsubst $(MOVIE_INPUT)%, $(MOVIE_OUTPUT)%, $(SRC_MOVIE_FILES))

# will essentially do nothing if PATH_SEPARATOR = /
DST_MOVIE_FILES := $(subst /,$(PATH_SEPARATOR),$(DST_MOVIE_FILES))

SRC_VIDEOS = $(wildcard $(addprefix $(MOVIE_INPUT)/, *.mp4))
SRC_VIDEOS := $(subst /,$(PATH_SEPARATOR),$(SRC_VIDEOS))
DST_VIDEOS = $(SRC_VIDEOS:.mp4=.mpg)
DST_VIDEOS := $(patsubst $(MOVIE_INPUT)%, $(MOVIE_OUTPUT)%, $(DST_VIDEOS))

ALL_MOVIE_TARGETS = $(DST_MOVIE_FILES) $(DST_VIDEOS)

#$(info List of DST_VIDEOS is $(DST_VIDEOS))
#$(info List of DST_MOVIE_FILES is $(DST_MOVIE_FILES))
#$(info ffmpeg location -  $(FFMPEG))
#$(info Movie targets -  $(ALL_MOVIE_TARGETS))

.PHONY: movie_clean

movie_clean:
	$(RM) $(DST_MOVIE_FILES)
	$(RM) $(DST_VIDEOS)
	$(RMDIR) $(MOVIE_OUTPUT)

$(MOVIE_OUTPUT):
	$(MKDIR) $(MOVIE_OUTPUT)

ifeq ($(BUILD_PLATFORM), linux)

$(MOVIE_OUTPUT)$(PATH_SEPARATOR)%.tga: $(MOVIE_INPUT)$(PATH_SEPARATOR)%.tga
	$(COPY)  $< $@

$(MOVIE_OUTPUT)$(PATH_SEPARATOR)%.mpg: $(MOVIE_INPUT)$(PATH_SEPARATOR)%.mp4
	ffmpeg -i $< -c:v mpeg1video -q:v 0 -c:a mp2 -b:a 224k -r 24 -format mpeg $@

else

# I do not know why do I need to escape path separator (only on windows though), but it does not work otherwise, even though dependency need only one path separator
$(MOVIE_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.tga: $(MOVIE_INPUT)$(PATH_SEPARATOR)%.tga
	$(COPY)  $< $@

$(MOVIE_OUTPUT)$(PATH_SEPARATOR)$(PATH_SEPARATOR)%.mpg: $(MOVIE_INPUT)$(PATH_SEPARATOR)%.mp4
	$(FFMPEG) -i $< -c:v mpeg1video -q:v 0 -c:a mp2 -b:a 224k -r 24 -format mpeg $@

endif

$(ALL_MOVIE_TARGETS) : | $(MOVIE_OUTPUT)

ALL_TARGETS += $(ALL_MOVIE_TARGETS)
ALL_CLEAN_TARGETS += movie_clean
