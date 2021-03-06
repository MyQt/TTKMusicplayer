# =================================================
# * This file is part of the TTK Music Player project
# * Copyright (c) 2015 - 2017 Greedysky Studio
# * All rights reserved!
# * Redistribution and use of the source code or any derivative
# * works are strictly forbiden.
# =================================================

equals(QT_MAJOR_VERSION, 5){
    win32{
        msvc{
            exists($$[QT_INSTALL_LIBS]/libQt5WebKit.lib){
                QT       += webkit webkitwidgets
                DEFINES  += MUSIC_WEBKIT
            }
        }

        gcc{
            exists($$[QT_INSTALL_LIBS]/libQt5WebKit.a){
                QT       += webkit webkitwidgets
                DEFINES  += MUSIC_WEBKIT
            }
        }
    }

    unix:!mac{
        exists($$[QT_INSTALL_LIBS]/libQt5WebKit.so){
            QT       += webkit webkitwidgets
            DEFINES  += MUSIC_WEBKIT
        }
    }
}
else{
    QT       += webkit webkitwidgets
    DEFINES  += MUSIC_WEBKIT
}

contains(QT, webkit){
    message("Found Qt webkit component, build in KuGou by Qt webkit")
}
else{
    message("Not found Qt webkit component, build in KuGou by no webkit")
}

INCLUDEPATH += $$PWD

HEADERS  += \
    $$PWD/kugouurl.h \
    $$PWD/kugouwindow.h \
    $$PWD/kugouuiobject.h

SOURCES += \
    $$PWD/kugouurl.cpp \
    $$PWD/kugouwindow.cpp
