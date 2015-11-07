/*
 * MidiEditor
 * Copyright (C) 2010  Markus Schwenk
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MIDIFILE_H_
#define MIDIFILE_H_

#include "../protocol/ProtocolEntry.h"

#include <QDataStream>
#include <QMultiMap>
#include <QObject>
#include <QList>

class MidiEvent;
class TimeSignatureEvent;
class TempoChangeEvent;
class Protocol;
class MidiChannel;
class MidiTrack;

class MidiFile : public QObject, public ProtocolEntry {

	Q_OBJECT

	public:
		MidiFile(QString path, bool *ok, QStringList *log = 0);
		MidiFile();
		// needed to protocol fileLength
		MidiFile(int maxTime, Protocol *p);
		bool save(QString path);
		QByteArray writeDeltaTime(int time);
		int maxTime();
		int endTick();
		int timeMS(int midiTime);
		int measure(int midiTime, int &midiTimeInMeasure);
		QMap<int, MidiEvent*> *tempoEvents();
		QMap<int, MidiEvent*> *timeSignatureEvents();
		void calcMaxTime();
		int tick(int ms);
		int tick(int startms, int endms, QList<MidiEvent*> **events, int *endTick, int *msOfFirstEvent);
		int measure(int startTick, int endTick, QList<TimeSignatureEvent*> **eventList, int *ticksLeft = 0);
		int msOfTick(int tick, QList<MidiEvent*> *events = 0, int msOfFirstEventInList = 0);

		QList<MidiEvent*> *eventsBetween(int start, int end);
		int ticksPerQuarter();
		QMultiMap<int, MidiEvent*> *channelEvents(int channel);

		Protocol *protocol();
		MidiChannel *channel(int i);
		void preparePlayerData(int tickFrom);
		QMultiMap<int, MidiEvent*> *playerData();

		static QString instrumentName(int prog);
		static QString controlChangeName(int control);
		int cursorTick();
		int pauseTick();
		void setCursorTick(int tick);
		void setPauseTick(int tick);
		QString path();
		bool saved();
		void setSaved(bool b);
		void setPath(QString path);
		bool channelMuted(int ch);
		int numTracks();
		QList<MidiTrack*> *tracks();
		void addTrack();
		void setMaxLengthMs(int ms);

		ProtocolEntry *copy();
		void reloadState(ProtocolEntry *entry);
		MidiFile *file();
		bool removeTrack(MidiTrack *track);
		MidiTrack *track(int number);

		int tonalityAt(int tick);
		void meterAt(int tick, int *num, int *denum);

		static int variableLengthvalue(QDataStream *content);
		static QByteArray writeVariableLengthValue(int value);
	signals:
		void cursorPositionChanged();
		void recalcWidgetSize();
		void trackChanged();

	private:
		bool readMidiFile(QDataStream *content, QStringList *log);
		bool readTrack(QDataStream *content, int num, QStringList *log);
		int deltaTime(QDataStream *content);

		int timePerQuarter;
		MidiChannel *channels[19];

		QString _path;
		int midiTicks, maxTimeMS, _cursorTick, _pauseTick, _midiFormat;
		Protocol *prot;
		QMultiMap<int, MidiEvent*> *playerMap;
		bool _saved;
		QList<MidiTrack*> *_tracks;

		void printLog(QStringList *log);
};

#endif
