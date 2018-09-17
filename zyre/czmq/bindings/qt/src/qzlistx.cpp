/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/

#include "qczmq.h"

///
//  Copy-construct to return the proper wrapped c types
QZlistx::QZlistx (zlistx_t *self, QObject *qObjParent) : QObject (qObjParent)
{
    this->self = self;
}


///
//  Create a new, empty list.
QZlistx::QZlistx (QObject *qObjParent) : QObject (qObjParent)
{
    this->self = zlistx_new ();
}

///
//  Destroy a list. If an item destructor was specified, all items in the
//  list are automatically destroyed as well.
QZlistx::~QZlistx ()
{
    zlistx_destroy (&self);
}

///
//  Add an item to the head of the list. Calls the item duplicator, if any,
//  on the item. Resets cursor to list head. Returns an item handle on
//  success, NULL if memory was exhausted.
void * QZlistx::addStart (void *item)
{
    void * rv = zlistx_add_start (self, item);
    return rv;
}

///
//  Add an item to the tail of the list. Calls the item duplicator, if any,
//  on the item. Resets cursor to list head. Returns an item handle on
//  success, NULL if memory was exhausted.
void * QZlistx::addEnd (void *item)
{
    void * rv = zlistx_add_end (self, item);
    return rv;
}

///
//  Return the number of items in the list
size_t QZlistx::size ()
{
    size_t rv = zlistx_size (self);
    return rv;
}

///
//  Return first item in the list, or null, leaves the cursor
void * QZlistx::head ()
{
    void * rv = zlistx_head (self);
    return rv;
}

///
//  Return last item in the list, or null, leaves the cursor
void * QZlistx::tail ()
{
    void * rv = zlistx_tail (self);
    return rv;
}

///
//  Return the item at the head of list. If the list is empty, returns NULL.
//  Leaves cursor pointing at the head item, or NULL if the list is empty.
void * QZlistx::first ()
{
    void * rv = zlistx_first (self);
    return rv;
}

///
//  Return the next item. At the end of the list (or in an empty list),
//  returns NULL. Use repeated zlistx_next () calls to work through the list
//  from zlistx_first (). First time, acts as zlistx_first().
void * QZlistx::next ()
{
    void * rv = zlistx_next (self);
    return rv;
}

///
//  Return the previous item. At the start of the list (or in an empty list),
//  returns NULL. Use repeated zlistx_prev () calls to work through the list
//  backwards from zlistx_last (). First time, acts as zlistx_last().
void * QZlistx::prev ()
{
    void * rv = zlistx_prev (self);
    return rv;
}

///
//  Return the item at the tail of list. If the list is empty, returns NULL.
//  Leaves cursor pointing at the tail item, or NULL if the list is empty.
void * QZlistx::last ()
{
    void * rv = zlistx_last (self);
    return rv;
}

///
//  Returns the value of the item at the cursor, or NULL if the cursor is
//  not pointing to an item.
void * QZlistx::item ()
{
    void * rv = zlistx_item (self);
    return rv;
}

///
//  Returns the handle of the item at the cursor, or NULL if the cursor is
//  not pointing to an item.
void * QZlistx::cursor ()
{
    void * rv = zlistx_cursor (self);
    return rv;
}

///
//  Returns the item associated with the given list handle, or NULL if passed
//  in handle is NULL. Asserts that the passed in handle points to a list element.
void * QZlistx::handleItem (void *handle)
{
    void * rv = zlistx_handle_item (handle);
    return rv;
}

///
//  Find an item in the list, searching from the start. Uses the item
//  comparator, if any, else compares item values directly. Returns the
//  item handle found, or NULL. Sets the cursor to the found item, if any.
void * QZlistx::find (void *item)
{
    void * rv = zlistx_find (self, item);
    return rv;
}

///
//  Detach an item from the list, using its handle. The item is not modified,
//  and the caller is responsible for destroying it if necessary. If handle is
//  null, detaches the first item on the list. Returns item that was detached,
//  or null if none was. If cursor was at item, moves cursor to previous item,
//  so you can detach items while iterating forwards through a list.
void * QZlistx::detach (void *handle)
{
    void * rv = zlistx_detach (self, handle);
    return rv;
}

///
//  Detach item at the cursor, if any, from the list. The item is not modified,
//  and the caller is responsible for destroying it as necessary. Returns item
//  that was detached, or null if none was. Moves cursor to previous item, so
//  you can detach items while iterating forwards through a list.
void * QZlistx::detachCur ()
{
    void * rv = zlistx_detach_cur (self);
    return rv;
}

///
//  Delete an item, using its handle. Calls the item destructor is any is
//  set. If handle is null, deletes the first item on the list. Returns 0
//  if an item was deleted, -1 if not. If cursor was at item, moves cursor
//  to previous item, so you can delete items while iterating forwards
//  through a list.
int QZlistx::deleteNoConflict (void *handle)
{
    int rv = zlistx_delete (self, handle);
    return rv;
}

///
//  Move an item to the start of the list, via its handle.
void QZlistx::moveStart (void *handle)
{
    zlistx_move_start (self, handle);

}

///
//  Move an item to the end of the list, via its handle.
void QZlistx::moveEnd (void *handle)
{
    zlistx_move_end (self, handle);

}

///
//  Remove all items from the list, and destroy them if the item destructor
//  is set.
void QZlistx::purge ()
{
    zlistx_purge (self);

}

///
//  Sort the list. If an item comparator was set, calls that to compare
//  items, otherwise compares on item value. The sort is not stable, so may
//  reorder equal items.
void QZlistx::sort ()
{
    zlistx_sort (self);

}

///
//  Create a new node and insert it into a sorted list. Calls the item
//  duplicator, if any, on the item. If low_value is true, starts searching
//  from the start of the list, otherwise searches from the end. Use the item
//  comparator, if any, to find where to place the new node. Returns a handle
//  to the new node, or NULL if memory was exhausted. Resets the cursor to the
//  list head.
void * QZlistx::insert (void *item, bool lowValue)
{
    void * rv = zlistx_insert (self, item, lowValue);
    return rv;
}

///
//  Move an item, specified by handle, into position in a sorted list. Uses
//  the item comparator, if any, to determine the new location. If low_value
//  is true, starts searching from the start of the list, otherwise searches
//  from the end.
void QZlistx::reorder (void *handle, bool lowValue)
{
    zlistx_reorder (self, handle, lowValue);

}

///
//  Make a copy of the list; items are duplicated if you set a duplicator
//  for the list, otherwise not. Copying a null reference returns a null
//  reference.
QZlistx * QZlistx::dup ()
{
    QZlistx *rv = new QZlistx (zlistx_dup (self));
    return rv;
}

///
//  Set a user-defined deallocator for list items; by default items are not
//  freed when the list is destroyed.
void QZlistx::setDestructor (zlistx_destructor_fn destructor)
{
    zlistx_set_destructor (self, destructor);

}

///
//  Set a user-defined duplicator for list items; by default items are not
//  copied when the list is duplicated.
void QZlistx::setDuplicator (zlistx_duplicator_fn duplicator)
{
    zlistx_set_duplicator (self, duplicator);

}

///
//  Set a user-defined comparator for zlistx_find and zlistx_sort; the method
//  must return -1, 0, or 1 depending on whether item1 is less than, equal to,
//  or greater than, item2.
void QZlistx::setComparator (zlistx_comparator_fn comparator)
{
    zlistx_set_comparator (self, comparator);

}

///
//  Self test of this class.
void QZlistx::test (bool verbose)
{
    zlistx_test (verbose);

}
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
