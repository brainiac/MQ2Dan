################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
from __future__ import print_function
from .zyre_cffi import ffi
from .zyre_py_destructors import lib as libwrapper
from .build_zyre_cffi import lib
from .utils import *


class ZyreEvent(object):
    """
    Parsing Zyre messages
    """

    def __init__(self, node):
        """
        Constructor: receive an event from the zyre node, wraps zyre_recv.
        The event may be a control message (ENTER, EXIT, JOIN, LEAVE) or  
        data (WHISPER, SHOUT).                                            
        """
        p = lib.zyre_event_new(node._p)
        if p == ffi.NULL:
            raise MemoryError("Could not allocate person")

        # ffi.gc returns a copy of the cdata object which will have the
        # destructor called when the Python object is GC'd:
        # https://cffi.readthedocs.org/en/latest/using.html#ffi-interface
        self._p = ffi.gc(p, libwrapper.zyre_event_destroy_py)

    def type(self):
        """
        Returns event type, as printable uppercase string. Choices are:   
        "ENTER", "EXIT", "JOIN", "LEAVE", "EVASIVE", "WHISPER" and "SHOUT"
        and for the local node: "STOP"                                    
        """
        return lib.zyre_event_type(self._p)

    def peer_uuid(self):
        """
        Return the sending peer's uuid as a string
        """
        return lib.zyre_event_peer_uuid(self._p)

    def peer_name(self):
        """
        Return the sending peer's public name as a string
        """
        return lib.zyre_event_peer_name(self._p)

    def peer_addr(self):
        """
        Return the sending peer's ipaddress as a string
        """
        return lib.zyre_event_peer_addr(self._p)

    def headers(self):
        """
        Returns the event headers, or NULL if there are none
        """
        return lib.zyre_event_headers(self._p)

    def header(self, name):
        """
        Returns value of a header from the message headers   
        obtained by ENTER. Return NULL if no value was found.
        """
        return lib.zyre_event_header(self._p, to_bytes(name))

    def group(self):
        """
        Returns the group name that a SHOUT event was sent to
        """
        return lib.zyre_event_group(self._p)

    def msg(self):
        """
        Returns the incoming message payload; the caller can modify the
        message but does not own it and should not destroy it.         
        """
        return lib.zyre_event_msg(self._p)

    def get_msg(self):
        """
        Returns the incoming message payload, and pass ownership to the   
        caller. The caller must destroy the message when finished with it.
        After called on the given event, further calls will return NULL.  
        """
        return lib.zyre_event_get_msg(self._p)

    def print(self):
        """
        Print event to zsys log
        """
        return lib.zyre_event_print(self._p)

    def test(verbose):
        """
        Self test of this class.
        """
        return lib.zyre_event_test(verbose)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
