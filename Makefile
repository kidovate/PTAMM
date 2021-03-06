# DO NOT DELETE THIS LINE -- make depend depends on it.


#3DS modelling game dependencies
3DSLIB = -l3ds
3DSFILES =	ModelsGame.o\
		ModelBrowser.o\
		ModelControls.o\
		MGButton.o\
		Model3ds.o\
		ModelsGameData.o

EXTRA_CFLAGS:= -DENABLE_MODELS_GAME

# Edit the lines below to point to any needed include and link paths
# Or to change the compiler's optimization flags
CC = g++
COMPILEFLAGS = -I./thirdparty/TooN/include/ -I./thirdparty/libcvd/include/ -I./thirdparty/lib3ds/lib3ds/local/include/ -I./thirdparty/gvars3/include/ -I./thirdparty/agast/include/ -D_LINUX -D_REENTRANT -Wall  -O3 -march=nocona -msse3 -fno-strict-aliasing -I/usr/include/opencv2/
LINKFLAGS = -L./thirdparty/libcvd/lib/ -L./thirdparty/gvars3/lib/ -L./thirdparty/lib3ds/lib3ds/local/lib/ -lGVars3 -lcvd $(3DSLIB) -L/usr/local/lib -lopencv_legacy -lopencv_core -lopencv_video -lopencv_highgui -llapack -lglut -lGL -lGLU -lreadline
# VIDEOSOURCE = VideoSource_Linux_DV.o
VIDEOSOURCE = VideoSource_Linux_OpenCV.o

OBJECTS=	main.o\
		GLWindow2.o\
		GLWindowMenu.o\
		$(VIDEOSOURCE)\
		System.o \
		ATANCamera.o\
		KeyFrame.o\
		MapPoint.o\
		Map.o\
		SmallBlurryImage.o\
		ShiTomasi.o \
		HomographyInit.o \
		MapMaker.o \
		Bundle.o \
		PatchFinder.o\
		Relocaliser.o\
		MiniPatch.o\
		MapViewer.o\
		ARDriver.o\
		EyeGame.o\
		Tracker.o\
		tinyxml.o\
		tinyxmlerror.o\
		tinyxmlparser.o\
		MapLockManager.o\
		MD5.o\
		MD5Wrapper.o\
		MapSerializer.o\
		Games.o\
		Utils.o\
		ShooterGame.o\
		ShooterGameTarget.o\
		$(3DSFILES)


CALIB_OBJECTS=	GLWindow2.o\
		GLWindowMenu.o\
		$(VIDEOSOURCE)\
		CalibImage.o \
		CalibCornerPatch.o\
		ATANCamera.o \
		CameraCalibrator.o

All: Deps PTAMM CameraCalibrator

Deps:
	cd thirdparty && make

PTAMM: $(OBJECTS)
	$(CC) -o PTAMM $(OBJECTS) $(LINKFLAGS)

CameraCalibrator:$(CALIB_OBJECTS)
	$(CC) -o CameraCalibrator $(CALIB_OBJECTS) $(LINKFLAGS)


%.o: %.cc
	$(CC) $< -o $@ -c $(COMPILEFLAGS) $(EXTRA_CFLAGS)

clean:
	-rm *.so*
	-rm *.o
thirdpartyclean: clean
	-cd thirdparty && make clean
distclean: clean
	-cd thirdparty && make distclean

depend:
	rm dependecies; touch dependencies
	makedepend -fdependencies $(INCLUDEFLAGS) $(MOREINCS) *.cc *.h


-include dependencies









