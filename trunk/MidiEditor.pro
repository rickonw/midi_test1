TEMPLATE = app
TARGET = MidiEditor
QT += core \
    network \
    xml
#DEFINES += ENABLE_REMOTE
HEADERS += \
    src/MidiEvent/KeySignatureEvent.h \
    src/remote/RemoteServer.h \
    src/gui/InstrumentChooser.h \
    src/gui/TransposeDialog.h \
    src/MidiEvent/TextEvent.h \
    src/gui/TrackListWidget.h \
    src/midi/MidiTrack.h \
    src/midi/SenderThread.h \
    src/Terminal.h \
    src/gui/RecordDialog.h \
    src/midi/MidiInput.h \
    src/midi/rtmidi/RtMidi.h \
    src/gui/FileLengthDialog.h \
    src/gui/AboutDialog.h \
    src/gui/DonateDialog.h \
    src/MidiEvent/ChannelPressureEvent.h \
    src/MidiEvent/KeyPressureEvent.h \
    src/gui/EventWidget.h \
    src/midi/SingleNotePlayer.h \
    src/MidiEvent/ControlChangeEvent.h \
    src/MidiEvent/ProgChangeEvent.h \
    src/midi/PlayerThread.h \
    src/midi/MidiPlayer.h \
    src/midi/MidiOutput.h \
    src/tool/StandardTool.h \
    src/gui/ClickButton.h \
    src/tool/SizeChangeTool.h \
    src/tool/EraserTool.h \
    src/tool/NewNoteTool.h \
    src/MidiEvent/OnEvent.h \
    src/MidiEvent/OffEvent.h \
    src/gui/ProtocolWidget.h \
    src/gui/ChannelListWidget.h \
    src/gui/EventListWidget.h \
    src/gui/GraphicObject.h \
    src/gui/MainWindow.h \
    src/gui/MatrixWidget.h \
    src/gui/PaintWidget.h \
    src/midi/MidiChannel.h \
    src/midi/MidiFile.h \
    src/tool/EventMoveTool.h \
    src/tool/SelectTool.h \
    src/tool/EventTool.h \
    src/tool/ToolButton.h \
    src/tool/EditorTool.h \
    src/tool/Tool.h \
    src/protocol/ProtocolStep.h \
    src/protocol/ProtocolItem.h \
    src/protocol/ProtocolEntry.h \
    src/protocol/Protocol.h \
    src/MidiEvent/TimeSignatureEvent.h \
    src/MidiEvent/TempoChangeEvent.h \
    src/MidiEvent/UnknownEvent.h \
    src/MidiEvent/NoteOnEvent.h \
    src/MidiEvent/PitchBendEvent.h \
    src/MidiEvent/MidiEvent.h \
    src/gui/MiscWidget.h \
    src/MidiEvent/SysExEvent.h \
    src/gui/DataEditor.h \
    src/gui/SettingsWidget.h \
    src/gui/SettingsDialog.h \
    src/gui/MidiSettingsWidget.h \
    src/gui/RemoteSettingsWidget.h \
    src/midi/Metronome.h \
    src/gui/NToleQuantizationDialog.h \
    src/tool/Selection.h \
    src/UpdateManager.h \
    src/gui/UpdateSettingsWidget.h \
    src/gui/UpdateDialog.h
SOURCES += \
    src/MidiEvent/KeySignatureEvent.cpp \
    src/remote/RemoteServer.cpp \
    src/gui/InstrumentChooser.cpp \
    src/gui/TransposeDialog.cpp \
    src/MidiEvent/TextEvent.cpp \
    src/gui/TrackListWidget.cpp \
    src/midi/MidiTrack.cpp \
    src/midi/SenderThread.cpp \
    src/Terminal.cpp \
    src/gui/RecordDialog.cpp \
    src/midi/MidiInput.cpp \
    src/midi/rtmidi/RtMidi.cpp \
    src/gui/FileLengthDialog.cpp \
    src/gui/AboutDialog.cpp \
    src/gui/DonateDialog.cpp \
    src/MidiEvent/ChannelPressureEvent.cpp \
    src/MidiEvent/KeyPressureEvent.cpp \
    src/gui/EventWidget.cpp \
    src/midi/SingleNotePlayer.cpp \
    src/MidiEvent/ControlChangeEvent.cpp \
    src/MidiEvent/ProgChangeEvent.cpp \
    src/midi/PlayerThread.cpp \
    src/midi/MidiPlayer.cpp \
    src/midi/MidiOutput.cpp \
    src/tool/StandardTool.cpp \
    src/gui/ClickButton.cpp \
    src/tool/SizeChangeTool.cpp \
    src/tool/EraserTool.cpp \
    src/tool/NewNoteTool.cpp \
    src/MidiEvent/OnEvent.cpp \
    src/MidiEvent/OffEvent.cpp \
    src/gui/ProtocolWidget.cpp \
    src/gui/ChannelListWidget.cpp \
    src/gui/EventListWidget.cpp \
    src/gui/GraphicObject.cpp \
    src/gui/MainWindow.cpp \
    src/gui/MatrixWidget.cpp \
    src/gui/PaintWidget.cpp \
    src/midi/MidiChannel.cpp \
    src/midi/MidiFile.cpp \
    src/tool/EventMoveTool.cpp \
    src/tool/SelectTool.cpp \
    src/tool/EventTool.cpp \
    src/tool/ToolButton.cpp \
    src/tool/EditorTool.cpp \
    src/tool/Tool.cpp \
    src/protocol/ProtocolStep.cpp \
    src/protocol/ProtocolItem.cpp \
    src/protocol/ProtocolEntry.cpp \
    src/protocol/Protocol.cpp \
    src/MidiEvent/TimeSignatureEvent.cpp \
    src/MidiEvent/TempoChangeEvent.cpp \
    src/MidiEvent/UnknownEvent.cpp \
    src/MidiEvent/NoteOnEvent.cpp \
    src/MidiEvent/MidiEvent.cpp \
    src/MidiEvent/PitchBendEvent.cpp \
    src/main.cpp \
    src/gui/MiscWidget.cpp \
    src/MidiEvent/SysExEvent.cpp \
    src/gui/DataEditor.cpp \
    src/gui/SettingsWidget.cpp \
    src/gui/SettingsDialog.cpp \
    src/gui/MidiSettingsWidget.cpp \
    src/gui/RemoteSettingsWidget.cpp \
    src/midi/Metronome.cpp \
    src/gui/NToleQuantizationDialog.cpp \
    src/tool/Selection.cpp \
    src/UpdateManager.cpp \
    src/gui/UpdateSettingsWidget.cpp \
    src/gui/UpdateDialog.cpp
FORMS += 
RESOURCES += 
message(get arch)
message($$(OVERRIDE_ARCH))
ARCH_FORCE = $$(OVERRIDE_ARCH)
contains(ARCH_FORCE, 64){
    DEFINES += __ARCH64__
    message(arch forced to 64 bit)
} else {
    contains(ARCH_FORCE, 32){
	message(arch forced to 32 bit)
    } else {
	contains(QMAKE_HOST.arch, x86_64):{
	    DEFINES += __ARCH64__
	    message(arch recognized as 64 bit)
	} else {
	    message(arch recognized as 32 bit)
	}
    }
}

unix: {
    DEFINES += __LINUX_ALSASEQ__
    DEFINES += __LINUX_ALSA__
    LIBS += -lasound -lsfml-system -lsfml-audio
    CONFIG += release
    OBJECTS_DIR = .tmp
    MOC_DIR = .tmp
}

win32: {
    DEFINES += __WINDOWS_MM__
    LIBS += -lwinmm
    CONFIG += release\
	    assistant
    RC_FILE = midieditor.rc
    OBJECTS_DIR = .tmp
    MOC_DIR = .tmp
    Release:DESTDIR = bin
}

OTHER_FILES += \
    run_environment/version_info.xml