
CXX=g++
INCLUDES=
FLAGS=-D__MACOSX_CORE__ -O3 -c
LIBS=-framework CoreAudio -framework CoreMIDI -framework CoreFoundation \
	-framework IOKit -framework Carbon  -framework OpenGL \
	-framework GLUT -framework Foundation \
	-framework AppKit -lstdc++ -lm

OBJS=   RtAudio.o JoshGoHome.o chuck_fft.o vector3d.o x-fun.o 

JoshGoHome: $(OBJS)
	$(CXX) -o JoshGoHome $(OBJS) $(LIBS)

JoshGoHome.o: JoshGoHome.cpp RtAudio.h
	$(CXX) $(FLAGS) JoshGoHome.cpp

RtAudio.o: RtAudio.h RtAudio.cpp RtError.h
	$(CXX) $(FLAGS) RtAudio.cpp

x-fun.o: x-fun.h x-fun.cpp
	$(CXX) $(FLAGS) x-fun.cpp


chuck_fft.o: chuck_fft.h chuck_fft.c
	$(CXX) $(FLAGS) chuck_fft.c

vector3d.o: vector3d.h vector3d.cpp
	$(CXX) $(FLAGS) vector3d.cpp

clean:
	rm -f *~ *# *.o JoshGoHome
