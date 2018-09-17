################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
from . import utils
from . import destructors
libczmq_destructors = destructors.lib

class Zlistx(object):
    """
    extended generic list container
    """

    def __init__(self):
        """
        Create a new, empty list.
        """
        p = utils.lib.zlistx_new()
        if p == utils.ffi.NULL:
            raise MemoryError("Could not allocate person")

        # ffi.gc returns a copy of the cdata object which will have the
        # destructor called when the Python object is GC'd:
        # https://cffi.readthedocs.org/en/latest/using.html#ffi-interface
        self._p = utils.ffi.gc(p, libczmq_destructors.zlistx_destroy_py)

    def add_start(self, item):
        """
        Add an item to the head of the list. Calls the item duplicator, if any,
        on the item. Resets cursor to list head. Returns an item handle on
        success, NULL if memory was exhausted.
        """
        return utils.lib.zlistx_add_start(self._p, item._p)

    def add_end(self, item):
        """
        Add an item to the tail of the list. Calls the item duplicator, if any,
        on the item. Resets cursor to list head. Returns an item handle on
        success, NULL if memory was exhausted.
        """
        return utils.lib.zlistx_add_end(self._p, item._p)

    def size(self):
        """
        Return the number of items in the list
        """
        return utils.lib.zlistx_size(self._p)

    def head(self):
        """
        Return first item in the list, or null, leaves the cursor
        """
        return utils.lib.zlistx_head(self._p)

    def tail(self):
        """
        Return last item in the list, or null, leaves the cursor
        """
        return utils.lib.zlistx_tail(self._p)

    def first(self):
        """
        Return the item at the head of list. If the list is empty, returns NULL.
        Leaves cursor pointing at the head item, or NULL if the list is empty.
        """
        return utils.lib.zlistx_first(self._p)

    def next(self):
        """
        Return the next item. At the end of the list (or in an empty list),
        returns NULL. Use repeated zlistx_next () calls to work through the list
        from zlistx_first (). First time, acts as zlistx_first().
        """
        return utils.lib.zlistx_next(self._p)

    def prev(self):
        """
        Return the previous item. At the start of the list (or in an empty list),
        returns NULL. Use repeated zlistx_prev () calls to work through the list
        backwards from zlistx_last (). First time, acts as zlistx_last().
        """
        return utils.lib.zlistx_prev(self._p)

    def last(self):
        """
        Return the item at the tail of list. If the list is empty, returns NULL.
        Leaves cursor pointing at the tail item, or NULL if the list is empty.
        """
        return utils.lib.zlistx_last(self._p)

    def item(self):
        """
        Returns the value of the item at the cursor, or NULL if the cursor is
        not pointing to an item.
        """
        return utils.lib.zlistx_item(self._p)

    def cursor(self):
        """
        Returns the handle of the item at the cursor, or NULL if the cursor is
        not pointing to an item.
        """
        return utils.lib.zlistx_cursor(self._p)

    def handle_item(handle):
        """
        Returns the item associated with the given list handle, or NULL if passed
        in handle is NULL. Asserts that the passed in handle points to a list element.
        """
        return utils.lib.zlistx_handle_item(handle._p)

    def find(self, item):
        """
        Find an item in the list, searching from the start. Uses the item
        comparator, if any, else compares item values directly. Returns the
        item handle found, or NULL. Sets the cursor to the found item, if any.
        """
        return utils.lib.zlistx_find(self._p, item._p)

    def detach(self, handle):
        """
        Detach an item from the list, using its handle. The item is not modified,
        and the caller is responsible for destroying it if necessary. If handle is
        null, detaches the first item on the list. Returns item that was detached,
        or null if none was. If cursor was at item, moves cursor to previous item,
        so you can detach items while iterating forwards through a list.
        """
        return utils.lib.zlistx_detach(self._p, handle._p)

    def detach_cur(self):
        """
        Detach item at the cursor, if any, from the list. The item is not modified,
        and the caller is responsible for destroying it as necessary. Returns item
        that was detached, or null if none was. Moves cursor to previous item, so
        you can detach items while iterating forwards through a list.
        """
        return utils.lib.zlistx_detach_cur(self._p)

    def delete(self, handle):
        """
        Delete an item, using its handle. Calls the item destructor is any is
        set. If handle is null, deletes the first item on the list. Returns 0
        if an item was deleted, -1 if not. If cursor was at item, moves cursor
        to previous item, so you can delete items while iterating forwards
        through a list.
        """
        return utils.lib.zlistx_delete(self._p, handle._p)

    def move_start(self, handle):
        """
        Move an item to the start of the list, via its handle.
        """
        utils.lib.zlistx_move_start(self._p, handle._p)

    def move_end(self, handle):
        """
        Move an item to the end of the list, via its handle.
        """
        utils.lib.zlistx_move_end(self._p, handle._p)

    def purge(self):
        """
        Remove all items from the list, and destroy them if the item destructor
        is set.
        """
        utils.lib.zlistx_purge(self._p)

    def sort(self):
        """
        Sort the list. If an item comparator was set, calls that to compare
        items, otherwise compares on item value. The sort is not stable, so may
        reorder equal items.
        """
        utils.lib.zlistx_sort(self._p)

    def insert(self, item, low_value):
        """
        Create a new node and insert it into a sorted list. Calls the item
        duplicator, if any, on the item. If low_value is true, starts searching
        from the start of the list, otherwise searches from the end. Use the item
        comparator, if any, to find where to place the new node. Returns a handle
        to the new node, or NULL if memory was exhausted. Resets the cursor to the
        list head.
        """
        return utils.lib.zlistx_insert(self._p, item._p, low_value)

    def reorder(self, handle, low_value):
        """
        Move an item, specified by handle, into position in a sorted list. Uses
        the item comparator, if any, to determine the new location. If low_value
        is true, starts searching from the start of the list, otherwise searches
        from the end.
        """
        utils.lib.zlistx_reorder(self._p, handle._p, low_value)

    def dup(self):
        """
        Make a copy of the list; items are duplicated if you set a duplicator
        for the list, otherwise not. Copying a null reference returns a null
        reference.
        """
        return utils.lib.zlistx_dup(self._p)

    def set_destructor(self, destructor):
        """
        Set a user-defined deallocator for list items; by default items are not
        freed when the list is destroyed.
        """
        utils.lib.zlistx_set_destructor(self._p, destructor)

    def set_duplicator(self, duplicator):
        """
        Set a user-defined duplicator for list items; by default items are not
        copied when the list is duplicated.
        """
        utils.lib.zlistx_set_duplicator(self._p, duplicator)

    def set_comparator(self, comparator):
        """
        Set a user-defined comparator for zlistx_find and zlistx_sort; the method
        must return -1, 0, or 1 depending on whether item1 is less than, equal to,
        or greater than, item2.
        """
        utils.lib.zlistx_set_comparator(self._p, comparator)

    def test(verbose):
        """
        Self test of this class.
        """
        utils.lib.zlistx_test(verbose)

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
