#include <stdio.h>
#include <stdlib.h>

#include <FL/Fl.h>
#include <FL/Fl_Window.h>
#include <FL/Fl_Box.h>

int main(int argc, char *argv[]) {
	Fl_Window *win = NULL;
	Fl_Box *box = NULL;

	win = new Fl_Window(300, 180);
	win->label("HelloWorld!");
	
	box = new Fl_Box(20, 40, 260, 100, "HelloWorld");
	box->labelsize(36);
	box->labelfont(FL_BOLD+FL_ITALIC);
	
	win->end();

	win->show(argc, argv);


	return Fl::run();
}
