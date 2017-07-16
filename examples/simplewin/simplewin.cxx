#include <stdio.h>
#include <stdlib.h>

#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Box.H>

using namespace std;


void but_cb(Fl_Widget *o, void *) {
#if 0 // normal 
	Fl_Button *b = (Fl_Button*)o;
	b->label("Good job");

	b->resize(10, 150, 140, 30);
	b->redraw();
#elif  1 //widget label pitfall
	char newcap[] = "changed";
	o->label(newcap);
#endif
}


int main(int argc, char *argv[]) {
	Fl_Window win(300, 200, "Testing");
	win.begin(); 
		Fl_Button but(10, 150, 70, 30, "Click Me");
	win.end();

	but.callback(but_cb);

	win.show();

	return Fl::run();
}
