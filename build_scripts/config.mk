ifeq ($(BUILD_PLATFORM), linux)
	COPY = cp
	MKDIR = mkdir
	RM = rm -f
	PATH_SEPARATOR2=/
else
	COPY = copy /Y
	MKDIR = md
	RM = del /Q
	# ok, here is what heppens here: \ - acts as "keep on same line" for make, but because I put a space here, it is not anymore (I've put a comment to signify this)
	# then we just strip it, this way we do not need to escape \ by one more \ (i.e. \\)
	PATH_SEPARATOR2=\ # space on purpose!
endif

SRC_DATA_ROOT = ..
DST_DATA_ROOT = .

PATH_SEPARATOR=$(strip $(PATH_SEPARATOR2))
