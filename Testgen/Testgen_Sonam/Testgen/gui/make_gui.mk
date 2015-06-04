FRAMAC_SHARE      := $(shell frama-c.byte -print-path)
FRAMAC_LIBDIR     := $(shell frama-c.byte -print-libpath)
PLUGIN_NAME       = Testgen
PLUGIN_CMO        = guiregister
PLUGIN_GUI_CMO =  testgen_gui
include $(FRAMAC_SHARE)/Makefile.dynamic
