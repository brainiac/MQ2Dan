/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/

#include "qczmq.h"

///
//  Copy-construct to return the proper wrapped c types
QZtimerset::QZtimerset (ztimerset_t *self, QObject *qObjParent) : QObject (qObjParent)
{
    this->self = self;
}


///
//  Create new timer set.
QZtimerset::QZtimerset (QObject *qObjParent) : QObject (qObjParent)
{
    this->self = ztimerset_new ();
}

///
//  Destroy a timer set
QZtimerset::~QZtimerset ()
{
    ztimerset_destroy (&self);
}

///
//  Add a timer to the set. Returns timer id if OK, -1 on failure.
int QZtimerset::add (size_t interval, ztimerset_fn handler, void *arg)
{
    int rv = ztimerset_add (self, interval, handler, arg);
    return rv;
}

///
//  Cancel a timer. Returns 0 if OK, -1 on failure.
int QZtimerset::cancel (int timerId)
{
    int rv = ztimerset_cancel (self, timerId);
    return rv;
}

///
//  Set timer interval. Returns 0 if OK, -1 on failure.
//  This method is slow, canceling the timer and adding a new one yield better performance.
int QZtimerset::setInterval (int timerId, size_t interval)
{
    int rv = ztimerset_set_interval (self, timerId, interval);
    return rv;
}

///
//  Reset timer to start interval counting from current time. Returns 0 if OK, -1 on failure.
//  This method is slow, canceling the timer and adding a new one yield better performance.
int QZtimerset::reset (int timerId)
{
    int rv = ztimerset_reset (self, timerId);
    return rv;
}

///
//  Return the time until the next interval.
//  Should be used as timeout parameter for the zpoller wait method.
//  The timeout is in msec.
int QZtimerset::timeout ()
{
    int rv = ztimerset_timeout (self);
    return rv;
}

///
//  Invoke callback function of all timers which their interval has elapsed.
//  Should be call after zpoller wait method.
//  Returns 0 if OK, -1 on failure.
int QZtimerset::execute ()
{
    int rv = ztimerset_execute (self);
    return rv;
}

///
//  Self test of this class.
void QZtimerset::test (bool verbose)
{
    ztimerset_test (verbose);

}
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
