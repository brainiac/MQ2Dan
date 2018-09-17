/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/

#include "QmlZframe.h"


///
//  Return number of bytes in frame data
size_t QmlZframe::size () {
    return zframe_size (self);
};

///
//  Return address of frame data
byte *QmlZframe::data () {
    return zframe_data (self);
};

///
//  Return meta data property for frame
//  The caller shall not modify or free the returned value, which shall be
//  owned by the message.
const QString QmlZframe::meta (const QString &property) {
    return QString (zframe_meta (self, property.toUtf8().data()));
};

///
//  Create a new frame that duplicates an existing frame. If frame is null,
//  or memory was exhausted, returns null.
QmlZframe *QmlZframe::dup () {
    QmlZframe *retQ_ = new QmlZframe ();
    retQ_->self = zframe_dup (self);
    return retQ_;
};

///
//  Return frame data encoded as printable hex string, useful for 0MQ UUIDs.
//  Caller must free string when finished with it.
QString QmlZframe::strhex () {
    char *retStr_ = zframe_strhex (self);
    QString retQStr_ = QString (retStr_);
    free (retStr_);
    return retQStr_;
};

///
//  Return frame data copied into freshly allocated string
//  Caller must free string when finished with it.
QString QmlZframe::strdup () {
    char *retStr_ = zframe_strdup (self);
    QString retQStr_ = QString (retStr_);
    free (retStr_);
    return retQStr_;
};

///
//  Return TRUE if frame body is equal to string, excluding terminator
bool QmlZframe::streq (const QString &string) {
    return zframe_streq (self, string.toUtf8().data());
};

///
//  Return frame MORE indicator (1 or 0), set when reading frame from socket
//  or by the zframe_set_more() method
int QmlZframe::more () {
    return zframe_more (self);
};

///
//  Set frame MORE indicator (1 or 0). Note this is NOT used when sending
//  frame to socket, you have to specify flag explicitly.
void QmlZframe::setMore (int more) {
    zframe_set_more (self, more);
};

///
//  Return frame routing ID, if the frame came from a ZMQ_SERVER socket.
//  Else returns zero.
uint32_t QmlZframe::routingId () {
    return zframe_routing_id (self);
};

///
//  Set routing ID on frame. This is used if/when the frame is sent to a
//  ZMQ_SERVER socket.
void QmlZframe::setRoutingId (uint32_t routingId) {
    zframe_set_routing_id (self, routingId);
};

///
//  Return frame group of radio-dish pattern.
const QString QmlZframe::group () {
    return QString (zframe_group (self));
};

///
//  Set group on frame. This is used if/when the frame is sent to a
//  ZMQ_RADIO socket.
//  Return -1 on error, 0 on success.
int QmlZframe::setGroup (const QString &group) {
    return zframe_set_group (self, group.toUtf8().data());
};

///
//  Return TRUE if two frames have identical size and data
//  If either frame is NULL, equality is always false.
bool QmlZframe::eq (QmlZframe *other) {
    return zframe_eq (self, other->self);
};

///
//  Set new contents for frame
void QmlZframe::reset (const void *data, size_t size) {
    zframe_reset (self, data, size);
};

///
//  Send message to zsys log sink (may be stdout, or system facility as
//  configured by zsys_set_logstream). Prefix shows before frame, if not null.
void QmlZframe::print (const QString &prefix) {
    zframe_print (self, prefix.toUtf8().data());
};


QObject* QmlZframe::qmlAttachedProperties(QObject* object) {
    return new QmlZframeAttached(object);
}


///
//  Send a frame to a socket, destroy frame after sending.
//  Return -1 on error, 0 on success.
int QmlZframeAttached::send (QmlZframe *selfP, void *dest, int flags) {
    return zframe_send (&selfP->self, dest, flags);
};

///
//  Probe the supplied object, and report if it looks like a zframe_t.
bool QmlZframeAttached::is (void *self) {
    return zframe_is (self);
};

///
//  Self test of this class.
void QmlZframeAttached::test (bool verbose) {
    zframe_test (verbose);
};

///
//  Create a new frame. If size is not null, allocates the frame data
//  to the specified size. If additionally, data is not null, copies
//  size octets from the specified data into the frame body.
QmlZframe *QmlZframeAttached::construct (const void *data, size_t size) {
    QmlZframe *qmlSelf = new QmlZframe ();
    qmlSelf->self = zframe_new (data, size);
    return qmlSelf;
};

///
//  Create an empty (zero-sized) frame
QmlZframe *QmlZframeAttached::constructEmpty () {
    QmlZframe *qmlSelf = new QmlZframe ();
    qmlSelf->self = zframe_new_empty ();
    return qmlSelf;
};

///
//  Create a frame with a specified string content.
QmlZframe *QmlZframeAttached::from (const QString &string) {
    QmlZframe *qmlSelf = new QmlZframe ();
    qmlSelf->self = zframe_from (string.toUtf8().data());
    return qmlSelf;
};

///
//  Receive frame from socket, returns zframe_t object or NULL if the recv
//  was interrupted. Does a blocking recv, if you want to not block then use
//  zpoller or zloop.
QmlZframe *QmlZframeAttached::recv (void *source) {
    QmlZframe *qmlSelf = new QmlZframe ();
    qmlSelf->self = zframe_recv (source);
    return qmlSelf;
};

///
//  Destroy a frame
void QmlZframeAttached::destruct (QmlZframe *qmlSelf) {
    zframe_destroy (&qmlSelf->self);
};

/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
