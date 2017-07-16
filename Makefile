ROOTDIR=$(shell pwd)
WORKDIR=$(ROOTDIR)/build

#targets	 += first
#targets	 += simplewin
#targets	 += talkeach
#targets	 += talking
#targets	 += inherited
targets	 += events

.PHONY: targets

all : $(targets)

# common srcs
#srcs							:= $(ROOTDIR)/main.c

srcs							+= $(ROOTDIR)/src/ayla/log.c
srcs							+= $(ROOTDIR)/src/ayla/lookup_by_name.c
srcs							+= $(ROOTDIR)/src/ayla/timer.c
srcs							+= $(ROOTDIR)/src/ayla/time_utils.c
srcs							+= $(ROOTDIR)/src/ayla/assert.c
srcs							+= $(ROOTDIR)/src/ayla/file_event.c
srcs							+= $(ROOTDIR)/src/ayla/file_io.c
srcs							+= $(ROOTDIR)/src/ayla/hashmap.c
srcs							+= $(ROOTDIR)/src/ayla/parse_argv.c
srcs							+= $(ROOTDIR)/src/ayla/hex.c

srcs							+= $(ROOTDIR)/src/lockqueue.c
srcs							+= $(ROOTDIR)/src/mutex.c
srcs							+= $(ROOTDIR)/src/cond.c
srcs							+= $(ROOTDIR)/src/list.c

# common objs
objs 							:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .c,.o,$(srcs)))


# first 
firstsrcs					:= $(ROOTDIR)/examples/first/first.cxx
firstobjs 				:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .cxx,.o,$(firstsrcs)))
firstobjs					+= $(shell fltk-config --libs)

# simplewin
simplewinsrcs					:= $(ROOTDIR)/examples/simplewin/simplewin.cxx
simplewinobjs 				:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .cxx,.o,$(simplewinsrcs)))
simplewinobjs					+= $(shell fltk-config --libs)

# talkeach
talkeachsrcs					:= $(ROOTDIR)/examples/talkeach/talkeach.cxx
talkeachobjs 				:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .cxx,.o,$(talkeachsrcs)))
talkeachobjs					+= $(shell fltk-config --libs)

# talking
talkingsrcs					:= $(ROOTDIR)/examples/talking/talking.cxx
talkingobjs 				:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .cxx,.o,$(talkingsrcs)))
talkingobjs					+= $(shell fltk-config --libs)

# inherited
inheritedsrcs					:= $(ROOTDIR)/examples/inherited/inherited.cxx
inheritedobjs 				:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .cxx,.o,$(inheritedsrcs)))
inheritedobjs					+= $(shell fltk-config --libs)

# events
eventssrcs					:= $(ROOTDIR)/examples/events/events.cxx
eventsobjs 				:= $(subst $(ROOTDIR),$(WORKDIR), $(subst .cxx,.o,$(eventssrcs)))
eventsobjs					+= $(shell fltk-config --libs)





-include $(ROOTDIR)/make/arch.mk
-include $(ROOTDIR)/make/rules.mk

$(eval $(call LinkApp,first,$(firstobjs)))
$(eval $(call LinkApp,simplewin,$(simplewinobjs)))
$(eval $(call LinkApp,talkeach,$(talkeachobjs)))
$(eval $(call LinkApp,talking,$(talkingobjs)))
$(eval $(call LinkApp,inherited,$(inheritedobjs)))
$(eval $(call LinkApp,events,$(eventsobjs)))


