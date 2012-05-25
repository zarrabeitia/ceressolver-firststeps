TEMPLATE = app
CONFIG += console
CONFIG -= qt

SOURCES += main.cpp \
    simplecostfunction.cpp \
    polyfit.cpp \
    polyfit_partial.cpp \
    polyfit_auto.cpp \
    polyfit_numerical.cpp \
    printparamscallback.cpp



CONFIG += link_pkgconfig
PKGCONFIG += eigen3 libgflags libglog protobuf

LIBS += -L"$$_PRO_FILE_PWD_/3rdparty/libs/" -lceres -lcsparse -lcholmod -fopenmp
INCLUDEPATH += "$$_PRO_FILE_PWD_/3rdparty/include"

#QMAKE_CXXFLAGS += -fopenmp
#QMAKE_LFLAGS +=  -fopenmp

HEADERS += \
    printparamscallback.h
