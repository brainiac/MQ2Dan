/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
package org.zeromq.czmq;

public class Zlistx implements AutoCloseable{
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
    Create a new, empty list.
    */
    native static long __new ();
    public Zlistx () {
        /*  TODO: if __new fails, self is null...            */
        self = __new ();
    }
    public Zlistx (long pointer) {
        self = pointer;
    }
    /*
    Destroy a list. If an item destructor was specified, all items in the
    list are automatically destroyed as well.
    */
    native static void __destroy (long self);
    @Override
    public void close () {
        __destroy (self);
        self = 0;
    }
    /*
    Add an item to the head of the list. Calls the item duplicator, if any,
    on the item. Resets cursor to list head. Returns an item handle on
    success, NULL if memory was exhausted.
    */
    native static long __addStart (long self, long item);
    public long addStart (long item) {
        return __addStart (self, item);
    }
    /*
    Add an item to the tail of the list. Calls the item duplicator, if any,
    on the item. Resets cursor to list head. Returns an item handle on
    success, NULL if memory was exhausted.
    */
    native static long __addEnd (long self, long item);
    public long addEnd (long item) {
        return __addEnd (self, item);
    }
    /*
    Return the number of items in the list
    */
    native static long __size (long self);
    public long size () {
        return __size (self);
    }
    /*
    Return first item in the list, or null, leaves the cursor
    */
    native static long __head (long self);
    public long head () {
        return __head (self);
    }
    /*
    Return last item in the list, or null, leaves the cursor
    */
    native static long __tail (long self);
    public long tail () {
        return __tail (self);
    }
    /*
    Return the item at the head of list. If the list is empty, returns NULL.
    Leaves cursor pointing at the head item, or NULL if the list is empty.
    */
    native static long __first (long self);
    public long first () {
        return __first (self);
    }
    /*
    Return the next item. At the end of the list (or in an empty list),
    returns NULL. Use repeated zlistx_next () calls to work through the list
    from zlistx_first (). First time, acts as zlistx_first().
    */
    native static long __next (long self);
    public long next () {
        return __next (self);
    }
    /*
    Return the previous item. At the start of the list (or in an empty list),
    returns NULL. Use repeated zlistx_prev () calls to work through the list
    backwards from zlistx_last (). First time, acts as zlistx_last().
    */
    native static long __prev (long self);
    public long prev () {
        return __prev (self);
    }
    /*
    Return the item at the tail of list. If the list is empty, returns NULL.
    Leaves cursor pointing at the tail item, or NULL if the list is empty.
    */
    native static long __last (long self);
    public long last () {
        return __last (self);
    }
    /*
    Returns the value of the item at the cursor, or NULL if the cursor is
    not pointing to an item.
    */
    native static long __item (long self);
    public long item () {
        return __item (self);
    }
    /*
    Returns the handle of the item at the cursor, or NULL if the cursor is
    not pointing to an item.
    */
    native static long __cursor (long self);
    public long cursor () {
        return __cursor (self);
    }
    /*
    Returns the item associated with the given list handle, or NULL if passed
    in handle is NULL. Asserts that the passed in handle points to a list element.
    */
    native static long __handleItem (long handle);
    public long handleItem (long handle) {
        return __handleItem (handle);
    }
    /*
    Find an item in the list, searching from the start. Uses the item
    comparator, if any, else compares item values directly. Returns the
    item handle found, or NULL. Sets the cursor to the found item, if any.
    */
    native static long __find (long self, long item);
    public long find (long item) {
        return __find (self, item);
    }
    /*
    Detach an item from the list, using its handle. The item is not modified,
    and the caller is responsible for destroying it if necessary. If handle is
    null, detaches the first item on the list. Returns item that was detached,
    or null if none was. If cursor was at item, moves cursor to previous item,
    so you can detach items while iterating forwards through a list.
    */
    native static long __detach (long self, long handle);
    public long detach (long handle) {
        return __detach (self, handle);
    }
    /*
    Detach item at the cursor, if any, from the list. The item is not modified,
    and the caller is responsible for destroying it as necessary. Returns item
    that was detached, or null if none was. Moves cursor to previous item, so
    you can detach items while iterating forwards through a list.
    */
    native static long __detachCur (long self);
    public long detachCur () {
        return __detachCur (self);
    }
    /*
    Delete an item, using its handle. Calls the item destructor is any is
    set. If handle is null, deletes the first item on the list. Returns 0
    if an item was deleted, -1 if not. If cursor was at item, moves cursor
    to previous item, so you can delete items while iterating forwards
    through a list.
    */
    native static int __delete (long self, long handle);
    public int delete (long handle) {
        return __delete (self, handle);
    }
    /*
    Move an item to the start of the list, via its handle.
    */
    native static void __moveStart (long self, long handle);
    public void moveStart (long handle) {
        __moveStart (self, handle);
    }
    /*
    Move an item to the end of the list, via its handle.
    */
    native static void __moveEnd (long self, long handle);
    public void moveEnd (long handle) {
        __moveEnd (self, handle);
    }
    /*
    Remove all items from the list, and destroy them if the item destructor
    is set.
    */
    native static void __purge (long self);
    public void purge () {
        __purge (self);
    }
    /*
    Sort the list. If an item comparator was set, calls that to compare
    items, otherwise compares on item value. The sort is not stable, so may
    reorder equal items.
    */
    native static void __sort (long self);
    public void sort () {
        __sort (self);
    }
    /*
    Create a new node and insert it into a sorted list. Calls the item
    duplicator, if any, on the item. If low_value is true, starts searching
    from the start of the list, otherwise searches from the end. Use the item
    comparator, if any, to find where to place the new node. Returns a handle
    to the new node, or NULL if memory was exhausted. Resets the cursor to the
    list head.
    */
    native static long __insert (long self, long item, boolean lowValue);
    public long insert (long item, boolean lowValue) {
        return __insert (self, item, lowValue);
    }
    /*
    Move an item, specified by handle, into position in a sorted list. Uses
    the item comparator, if any, to determine the new location. If low_value
    is true, starts searching from the start of the list, otherwise searches
    from the end.
    */
    native static void __reorder (long self, long handle, boolean lowValue);
    public void reorder (long handle, boolean lowValue) {
        __reorder (self, handle, lowValue);
    }
    /*
    Make a copy of the list; items are duplicated if you set a duplicator
    for the list, otherwise not. Copying a null reference returns a null
    reference.
    */
    native static long __dup (long self);
    public Zlistx dup () {
        return new Zlistx (__dup (self));
    }
    /*
    Self test of this class.
    */
    native static void __test (boolean verbose);
    public static void test (boolean verbose) {
        __test (verbose);
    }
}
