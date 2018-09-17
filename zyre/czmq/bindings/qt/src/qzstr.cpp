/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/

#include "qczmq.h"

///
//  Copy-construct to return the proper wrapped c types
QZstr::QZstr (zstr_t *self, QObject *qObjParent) : QObject (qObjParent)
{
    this->self = self;
}


///
//  Receive C string from socket. Caller must free returned string using
//  zstr_free(). Returns NULL if the context is being terminated or the
//  process was interrupted.
QString QZstr::recv (void *source)
{
    char *retStr_ = zstr_recv (source);
    QString rv = QString (retStr_);
    zstr_free (&retStr_);
    return rv;
}

///
//  De-compress and receive C string from socket, received as a message
//  with two frames: size of the uncompressed string, and the string itself.
//  Caller must free returned string using zstr_free(). Returns NULL if the
//  context is being terminated or the process was interrupted.
QString QZstr::recvCompress (void *source)
{
    char *retStr_ = zstr_recv_compress (source);
    QString rv = QString (retStr_);
    zstr_free (&retStr_);
    return rv;
}

///
//  Send a C string to a socket, as a frame. The string is sent without
//  trailing null byte; to read this you can use zstr_recv, or a similar
//  method that adds a null terminator on the received string. String
//  may be NULL, which is sent as "".
int QZstr::send (void *dest, const QString &string)
{
    int rv = zstr_send (dest, string.toUtf8().data());
    return rv;
}

///
//  Send a C string to a socket, as zstr_send(), with a MORE flag, so that
//  you can send further strings in the same multi-part message.
int QZstr::sendm (void *dest, const QString &string)
{
    int rv = zstr_sendm (dest, string.toUtf8().data());
    return rv;
}

///
//  Send a formatted string to a socket. Note that you should NOT use
//  user-supplied strings in the format (they may contain '%' which
//  will create security holes).
int QZstr::sendf (void *dest, const QString &param)
{
    int rv = zstr_sendf (dest, "%s", param.toUtf8().data());
    return rv;
}

///
//  Send a formatted string to a socket, as for zstr_sendf(), with a
//  MORE flag, so that you can send further strings in the same multi-part
//  message.
int QZstr::sendfm (void *dest, const QString &param)
{
    int rv = zstr_sendfm (dest, "%s", param.toUtf8().data());
    return rv;
}

///
//  Compress and send a C string to a socket, as a message with two frames:
//  size of the uncompressed string, and the string itself. The string is
//  sent without trailing null byte; to read this you can use
//  zstr_recv_compress, or a similar method that de-compresses and adds a
//  null terminator on the received string.
int QZstr::sendCompress (void *dest, const QString &string)
{
    int rv = zstr_send_compress (dest, string.toUtf8().data());
    return rv;
}

///
//  Compress and send a C string to a socket, as zstr_send_compress(),
//  with a MORE flag, so that you can send further strings in the same
//  multi-part message.
int QZstr::sendmCompress (void *dest, const QString &string)
{
    int rv = zstr_sendm_compress (dest, string.toUtf8().data());
    return rv;
}

///
//  Accepts a void pointer and returns a fresh character string. If source
//  is null, returns an empty string.
QString QZstr::str (void *source)
{
    char *retStr_ = zstr_str (source);
    QString rv = QString (retStr_);
    zstr_free (&retStr_);
    return rv;
}

///
//  Self test of this class.
void QZstr::test (bool verbose)
{
    zstr_test (verbose);

}
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
