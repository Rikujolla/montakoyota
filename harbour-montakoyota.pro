# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-montakoyota

CONFIG += sailfishapp

SOURCES += src/harbour-montakoyota.cpp

OTHER_FILES += qml/harbour-montakoyota.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-montakoyota.changes.in \
    rpm/harbour-montakoyota.spec \
    rpm/harbour-montakoyota.yaml \
    translations/*.ts \
    harbour-montakoyota.desktop \
    qml/pages/Kuvasivu.qml \
    qml/pages/Tapahtuma.qml \
    qml/pages/Uusitapahtuma.qml \
    qml/pages/Tietoja.qml \
    qml/TodoModel.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-montakoyota-de.ts \
                translations/harbour-montakoyota-fi.ts


