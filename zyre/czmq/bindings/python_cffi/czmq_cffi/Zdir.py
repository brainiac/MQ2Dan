################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
from . import utils
from . import destructors
libczmq_destructors = destructors.lib

class Zdir(object):
    """
    work with file-system directories
    """

    def __init__(self, path, parent):
        """
        Create a new directory item that loads in the full tree of the specified
        path, optionally located under some parent path. If parent is "-", then
        loads only the top-level directory, and does not use parent as a path.
        """
        p = utils.lib.zdir_new(utils.to_bytes(path), utils.to_bytes(parent))
        if p == utils.ffi.NULL:
            raise MemoryError("Could not allocate person")

        # ffi.gc returns a copy of the cdata object which will have the
        # destructor called when the Python object is GC'd:
        # https://cffi.readthedocs.org/en/latest/using.html#ffi-interface
        self._p = utils.ffi.gc(p, libczmq_destructors.zdir_destroy_py)

    def path(self):
        """
        Return directory path
        """
        return utils.lib.zdir_path(self._p)

    def modified(self):
        """
        Return last modification time for directory.
        """
        return utils.lib.zdir_modified(self._p)

    def cursize(self):
        """
        Return total hierarchy size, in bytes of data contained in all files
        in the directory tree.
        """
        return utils.lib.zdir_cursize(self._p)

    def count(self):
        """
        Return directory count
        """
        return utils.lib.zdir_count(self._p)

    def list(self):
        """
        Returns a sorted list of zfile objects; Each entry in the list is a pointer
        to a zfile_t item already allocated in the zdir tree. Do not destroy the
        original zdir tree until you are done with this list.
        """
        return utils.lib.zdir_list(self._p)

    def remove(self, force):
        """
        Remove directory, optionally including all files that it contains, at
        all levels. If force is false, will only remove the directory if empty.
        If force is true, will remove all files and all subdirectories.
        """
        utils.lib.zdir_remove(self._p, force)

    def diff(older, newer, alias):
        """
        Calculate differences between two versions of a directory tree.
        Returns a list of zdir_patch_t patches. Either older or newer may
        be null, indicating the directory is empty/absent. If alias is set,
        generates virtual filename (minus path, plus alias).
        """
        return utils.lib.zdir_diff(older._p, newer._p, utils.to_bytes(alias))

    def resync(self, alias):
        """
        Return full contents of directory as a zdir_patch list.
        """
        return utils.lib.zdir_resync(self._p, utils.to_bytes(alias))

    def cache(self):
        """
        Load directory cache; returns a hash table containing the SHA-1 digests
        of every file in the tree. The cache is saved between runs in .cache.
        """
        return utils.lib.zdir_cache(self._p)

    def fprint(self, file, indent):
        """
        Print contents of directory to open stream
        """
        utils.lib.zdir_fprint(self._p, file, indent)

    def print_py(self, indent):
        """
        Print contents of directory to stdout
        """
        utils.lib.zdir_print(self._p, indent)

    def watch(pipe, unused):
        """
        Create a new zdir_watch actor instance:

            zactor_t *watch = zactor_new (zdir_watch, NULL);

        Destroy zdir_watch instance:

            zactor_destroy (&watch);

        Enable verbose logging of commands and activity:

            zstr_send (watch, "VERBOSE");

        Subscribe to changes to a directory path:

            zsock_send (watch, "ss", "SUBSCRIBE", "directory_path");

        Unsubscribe from changes to a directory path:

            zsock_send (watch, "ss", "UNSUBSCRIBE", "directory_path");

        Receive directory changes:
            zsock_recv (watch, "sp", &path, &patches);

            // Delete the received data.
            free (path);
            zlist_destroy (&patches);
        """
        utils.lib.zdir_watch(pipe._p, unused._p)

    def test(verbose):
        """
        Self test of this class.
        """
        utils.lib.zdir_test(verbose)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
