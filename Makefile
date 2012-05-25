#############################################################################
# Makefile for building: ceres-test
# Generated by qmake (2.01a) (Qt 4.7.2) on: Fri May 25 12:24:19 2012
# Project:  ceres-test.pro
# Template: app
# Command: /usr/bin/qmake -o Makefile ceres-test.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = 
CFLAGS        = -pipe -O2 -I/usr/local/include/eigen3 -I/usr/local/include -pthread -Wall -W $(DEFINES)
CXXFLAGS      = -pipe -O2 -I/usr/local/include/eigen3 -I/usr/local/include -pthread -Wall -W $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++ -I. -I3rdparty/include
LINK          = g++
LFLAGS        = -Wl,-O1
LIBS          = $(SUBLIBS)   -L/home/kyrie/QT/ceres-test/3rdparty/libs/ -lceres -lcsparse -lcholmod -fopenmp -lgflags -L/usr/local/lib -lglog -pthread -lprotobuf -lz -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = main.cpp \
		simplecostfunction.cpp \
		polyfit.cpp \
		polyfit_partial.cpp \
		polyfit_auto.cpp \
		polyfit_numerical.cpp \
		printparamscallback.cpp 
OBJECTS       = main.o \
		simplecostfunction.o \
		polyfit.o \
		polyfit_partial.o \
		polyfit_auto.o \
		polyfit_numerical.o \
		printparamscallback.o
DIST          = /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/link_pkgconfig.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		ceres-test.pro
QMAKE_TARGET  = ceres-test
DESTDIR       = 
TARGET        = ceres-test

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET):  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: ceres-test.pro  /usr/share/qt4/mkspecs/linux-g++/qmake.conf /usr/share/qt4/mkspecs/common/g++.conf \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/link_pkgconfig.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf
	$(QMAKE) -o Makefile ceres-test.pro
/usr/share/qt4/mkspecs/common/g++.conf:
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/link_pkgconfig.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
qmake:  FORCE
	@$(QMAKE) -o Makefile ceres-test.pro

dist: 
	@$(CHK_DIR_EXISTS) .tmp/ceres-test1.0.0 || $(MKDIR) .tmp/ceres-test1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/ceres-test1.0.0/ && (cd `dirname .tmp/ceres-test1.0.0` && $(TAR) ceres-test1.0.0.tar ceres-test1.0.0 && $(COMPRESS) ceres-test1.0.0.tar) && $(MOVE) `dirname .tmp/ceres-test1.0.0`/ceres-test1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/ceres-test1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_uic_make_all:
compiler_uic_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: 

####### Compile

main.o: main.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

simplecostfunction.o: simplecostfunction.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o simplecostfunction.o simplecostfunction.cpp

polyfit.o: polyfit.cpp printparamscallback.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o polyfit.o polyfit.cpp

polyfit_partial.o: polyfit_partial.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o polyfit_partial.o polyfit_partial.cpp

polyfit_auto.o: polyfit_auto.cpp printparamscallback.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o polyfit_auto.o polyfit_auto.cpp

polyfit_numerical.o: polyfit_numerical.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o polyfit_numerical.o polyfit_numerical.cpp

printparamscallback.o: printparamscallback.cpp printparamscallback.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o printparamscallback.o printparamscallback.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:

