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

#include "AboutDialog.h"

#include <QIcon>
#include <QLabel>
#include <QPushButton>
#include <QGridLayout>
#include <QApplication>
#include <QVariant>

AboutDialog::AboutDialog(QWidget *parent):QDialog(parent)
{
	setWindowIcon(QIcon("graphics/icon.png"));

	QGridLayout *layout = new QGridLayout;

	//Label starttext
	QLabel *title = new QLabel("<h2><b>"+QApplication::applicationName()+" "+QApplication::applicationVersion()+"</b></h2>"
		"Copyright by Markus Schwenk"
		 " (kontakt@markus-schwenk.de)<br>Visit my Homepage: <a href=\""
		 "http://www.markus-schwenk.de\">www.markus-schwenk.de</a>"
		 "<br><br>"
		 "Thanks to Romain Behar."
		 "<br>"
		 "3D icons by Double-J Design (http://www.doublejdesign.co.uk)."
		 "<br>"
		"Flat icons designed by Freepik."
		"<br>"
		 "MidiEditor logo by Markus Schwenk.");
	title->setTextInteractionFlags(Qt::LinksAccessibleByMouse);
	title->setOpenExternalLinks(true);

	layout->addWidget(title, 0,0,1,4);

	QFrame *f0 = new QFrame( this );
	f0->setFrameStyle( QFrame::HLine | QFrame::Sunken );
	layout->addWidget( f0, 1, 0, 1, 4);


	QLabel *version = new QLabel("Version: "+QApplication::applicationName()+" "+QApplication::applicationVersion());
	layout->addWidget(version, 2,0,1,4);

	QLabel *date = new QLabel(QApplication::instance()->property("date_published").toString());
	layout->addWidget(date, 3, 0, 1, 4);

	QFrame *f3 = new QFrame( this );
	f3->setFrameStyle( QFrame::HLine | QFrame::Sunken );
	layout->addWidget( f3, 4, 0, 1, 4);

	QLabel *comment = new QLabel("Bugs:");
	layout->addWidget(comment, 5, 0, 1, 4);

	QLabel *mail = new QLabel("bugs@markus-schwenk.de");
	layout->addWidget(mail, 6, 0, 1, 4);

	QFrame *f = new QFrame( this );
	f->setFrameStyle( QFrame::HLine | QFrame::Sunken );
	layout->addWidget( f, 7, 0, 1, 4);

	// button close
	QPushButton *close = new QPushButton("Close");
	layout->addWidget(close, 8, 3, 1, 1);
	connect(close, SIGNAL(clicked()), this, SLOT(hide()));

	setLayout(layout);
	setWindowTitle(tr("About"));
}