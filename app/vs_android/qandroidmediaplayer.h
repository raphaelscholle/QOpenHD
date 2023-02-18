#ifndef QANDROIDMEDIAPLAYER_H
#define QANDROIDMEDIAPLAYER_H

#include <QAndroidJniObject>
#include <QObject>
#include <QPointer>

class QSurfaceTexture;
class QAndroidMediaPlayer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QSurfaceTexture *videoOut READ videoOut WRITE setVideoOut NOTIFY videoOutChanged)

public:
    QAndroidMediaPlayer(QObject *parent = nullptr);
    ~QAndroidMediaPlayer();

    QSurfaceTexture *videoOut() const;
    void setVideoOut(QSurfaceTexture *videoOut);

    Q_INVOKABLE void playFile(const QString &file);

signals:
    void videoOutChanged();

private:
    QPointer<QSurfaceTexture> m_videoOut;
    // Links to LiveVideoPlayerWrapper - it is honestly easier to write java code and then copy it over into QOpenHD
    // qt android (video) sucks
    QAndroidJniObject m_mediaPlayer;
};

#endif // QANDROIDMEDIAPLAYER_H
