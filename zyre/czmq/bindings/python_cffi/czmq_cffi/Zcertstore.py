################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
from . import utils
from . import destructors
libczmq_destructors = destructors.lib

class Zcertstore(object):
    """
    work with CURVE security certificate stores
    """

    def __init__(self, location):
        """
        Create a new certificate store from a disk directory, loading and
        indexing all certificates in that location. The directory itself may be
        absent, and created later, or modified at any time. The certificate store
        is automatically refreshed on any zcertstore_lookup() call. If the
        location is specified as NULL, creates a pure-memory store, which you
        can work with by inserting certificates at runtime.
        """
        p = utils.lib.zcertstore_new(utils.to_bytes(location))
        if p == utils.ffi.NULL:
            raise MemoryError("Could not allocate person")

        # ffi.gc returns a copy of the cdata object which will have the
        # destructor called when the Python object is GC'd:
        # https://cffi.readthedocs.org/en/latest/using.html#ffi-interface
        self._p = utils.ffi.gc(p, libczmq_destructors.zcertstore_destroy_py)

    def set_loader(self, loader, destructor, state):
        """
        Override the default disk loader with a custom loader fn.
        """
        utils.lib.zcertstore_set_loader(self._p, loader, destructor, state)

    def lookup(self, public_key):
        """
        Look up certificate by public key, returns zcert_t object if found,
        else returns NULL. The public key is provided in Z85 text format.
        """
        return utils.lib.zcertstore_lookup(self._p, utils.to_bytes(public_key))

    def insert(self, cert_p):
        """
        Insert certificate into certificate store in memory. Note that this
        does not save the certificate to disk. To do that, use zcert_save()
        directly on the certificate. Takes ownership of zcert_t object.
        """
        utils.lib.zcertstore_insert(self._p, cert_p._p)

    def empty(self):
        """
        Empty certificate hashtable. This wrapper exists to be friendly to bindings,
        which don't usually have access to struct internals.
        """
        utils.lib.zcertstore_empty(self._p)

    def print_py(self):
        """
        Print list of certificates in store to logging facility
        """
        utils.lib.zcertstore_print(self._p)

    def certs(self):
        """
        Return a list of all the certificates in the store.
        The caller takes ownership of the zlistx_t object and is responsible
        for destroying it.  The caller does not take ownership of the zcert_t
        objects.
        """
        return utils.lib.zcertstore_certs(self._p)

    def test(verbose):
        """
        Self test of this class
        """
        utils.lib.zcertstore_test(verbose)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
