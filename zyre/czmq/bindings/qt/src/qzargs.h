/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
#ifndef Q_ZARGS_H
#define Q_ZARGS_H

#include "qczmq.h"

class QT_CZMQ_EXPORT QZargs : public QObject
{
    Q_OBJECT
public:

    //  Copy-construct to return the proper wrapped c types
    QZargs (zargs_t *self, QObject *qObjParent = 0);

    //  Destroy zargs instance.
    ~QZargs ();

    //  Return program name (argv[0])
    const QString progname ();

    //  Return number of positional arguments
    size_t arguments ();

    //  Return first positional argument or NULL
    const QString first ();

    //  Return next positional argument or NULL
    const QString next ();

    //  Return first named parameter value, or NULL if there are no named
    //  parameters, or value for which zargs_param_empty (arg) returns true.
    const QString paramFirst ();

    //  Return next named parameter value, or NULL if there are no named
    //  parameters, or value for which zargs_param_empty (arg) returns true.
    const QString paramNext ();

    //  Return current parameter name, or NULL if there are no named parameters.
    const QString paramName ();

    //  Return value of named parameter or NULL is it has no value (or was not specified)
    const QString get (const QString &name);

    //  Returns true if named parameter was specified on command line
    bool has (const QString &name);

    //  Print an instance of zargs.
    void print ();

    //  Self test of this class.
    static void test (bool verbose);

    zargs_t *self;
};
#endif //  Q_ZARGS_H
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
