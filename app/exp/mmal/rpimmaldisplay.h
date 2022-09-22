#ifndef RPIMMALDISPLAY_H
#define RPIMMALDISPLAY_H


#include <interface/mmal/mmal.h>
#include <interface/mmal/util/mmal_util.h>
#include <interface/mmal/util/mmal_util_params.h>
#include <interface/mmal/util/mmal_default_components.h>


#include "avcodec_helper.hpp"

class RpiMMALDisplay
{
public:
    RpiMMALDisplay();
    static RpiMMALDisplay& instance();

    bool prepareDecoderContext(AVCodecContext* context, AVDictionary** options);

    void init(int video_width=1920,int video_height=1080);
    void cleanup();
    void updateDisplayRegion();
    void display_frame(AVFrame* frame);

    void display_mmal_frame(MMAL_BUFFER_HEADER_T* buffer);
private:
    MMAL_COMPONENT_T* m_Renderer=nullptr;
    MMAL_PORT_T* m_InputPort=nullptr;
    static void InputPortCallback(MMAL_PORT_T* port, MMAL_BUFFER_HEADER_T* buffer);
    //
    int m_VideoWidth, m_VideoHeight;
    int m_lastScreenWidth,m_lastScreenHeight;
    bool display_region_needs_update=true;
};

#endif // RPIMMALDISPLAY_H
