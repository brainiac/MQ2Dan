/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
package org.zeromq.czmq;

public class Zframe implements AutoCloseable{
    static {
        try {
            System.loadLibrary ("czmqjni");
        }
        catch (Exception e) {
            System.exit (-1);
        }
    }
    public long self;
    /*
    Create a new frame. If size is not null, allocates the frame data
    to the specified size. If additionally, data is not null, copies
    size octets from the specified data into the frame body.
    */
    native static long __new (byte [] data, long size);
    public Zframe (byte [] data, long size) {
        /*  TODO: if __new fails, self is null...            */
        self = __new (data, size);
    }
    public Zframe (long pointer) {
        self = pointer;
    }
    /*
    Create an empty (zero-sized) frame
    */
    native static long __newEmpty ();
    public static Zframe newEmpty () {
        return new Zframe (__newEmpty ());
    }
    /*
    Create a frame with a specified string content.
    */
    native static long __from (String string);
    public static Zframe from (String string) {
        return new Zframe (__from (string));
    }
    /*
    Receive frame from socket, returns zframe_t object or NULL if the recv
    was interrupted. Does a blocking recv, if you want to not block then use
    zpoller or zloop.
    */
    native static long __recv (long source);
    public static Zframe recv (long source) {
        return new Zframe (__recv (source));
    }
    /*
    Destroy a frame
    */
    native static void __destroy (long self);
    @Override
    public void close () {
        __destroy (self);
        self = 0;
    }
    /*
    Send a frame to a socket, destroy frame after sending.
    Return -1 on error, 0 on success.
    */
    native static long __send (long self, long dest, int flags);
    public int send (long dest, int flags) {
        self = __send (self, dest, flags);
        return 0;
    }
    /*
    Return number of bytes in frame data
    */
    native static long __size (long self);
    public long size () {
        return __size (self);
    }
    /*
    Return address of frame data
    */
    native static byte [] __data (long self);
    public byte [] data () {
        return __data (self);
    }
    /*
    Return meta data property for frame
    The caller shall not modify or free the returned value, which shall be
    owned by the message.
    */
    native static String __meta (long self, String property);
    public String meta (String property) {
        return __meta (self, property);
    }
    /*
    Create a new frame that duplicates an existing frame. If frame is null,
    or memory was exhausted, returns null.
    */
    native static long __dup (long self);
    public Zframe dup () {
        return new Zframe (__dup (self));
    }
    /*
    Return frame data encoded as printable hex string, useful for 0MQ UUIDs.
    Caller must free string when finished with it.
    */
    native static String __strhex (long self);
    public String strhex () {
        return __strhex (self);
    }
    /*
    Return frame data copied into freshly allocated string
    Caller must free string when finished with it.
    */
    native static String __strdup (long self);
    public String strdup () {
        return __strdup (self);
    }
    /*
    Return TRUE if frame body is equal to string, excluding terminator
    */
    native static boolean __streq (long self, String string);
    public boolean streq (String string) {
        return __streq (self, string);
    }
    /*
    Return frame MORE indicator (1 or 0), set when reading frame from socket
    or by the zframe_set_more() method
    */
    native static int __more (long self);
    public int more () {
        return __more (self);
    }
    /*
    Set frame MORE indicator (1 or 0). Note this is NOT used when sending
    frame to socket, you have to specify flag explicitly.
    */
    native static void __setMore (long self, int more);
    public void setMore (int more) {
        __setMore (self, more);
    }
    /*
    Return frame routing ID, if the frame came from a ZMQ_SERVER socket.
    Else returns zero.
    */
    native static int __routingId (long self);
    public int routingId () {
        return __routingId (self);
    }
    /*
    Set routing ID on frame. This is used if/when the frame is sent to a
    ZMQ_SERVER socket.
    */
    native static void __setRoutingId (long self, int routingId);
    public void setRoutingId (int routingId) {
        __setRoutingId (self, routingId);
    }
    /*
    Return frame group of radio-dish pattern.
    */
    native static String __group (long self);
    public String group () {
        return __group (self);
    }
    /*
    Set group on frame. This is used if/when the frame is sent to a
    ZMQ_RADIO socket.
    Return -1 on error, 0 on success.
    */
    native static int __setGroup (long self, String group);
    public int setGroup (String group) {
        return __setGroup (self, group);
    }
    /*
    Return TRUE if two frames have identical size and data
    If either frame is NULL, equality is always false.
    */
    native static boolean __eq (long self, long other);
    public boolean eq (Zframe other) {
        return __eq (self, other.self);
    }
    /*
    Set new contents for frame
    */
    native static void __reset (long self, byte [] data, long size);
    public void reset (byte [] data, long size) {
        __reset (self, data, size);
    }
    /*
    Send message to zsys log sink (may be stdout, or system facility as
    configured by zsys_set_logstream). Prefix shows before frame, if not null.
    */
    native static void __print (long self, String prefix);
    public void print (String prefix) {
        __print (self, prefix);
    }
    /*
    Probe the supplied object, and report if it looks like a zframe_t.
    */
    native static boolean __is (long self);
    public boolean is (long self) {
        return __is (self);
    }
    /*
    Self test of this class.
    */
    native static void __test (boolean verbose);
    public static void test (boolean verbose) {
        __test (verbose);
    }
}
