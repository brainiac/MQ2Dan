/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
#include <stdio.h>
#include <stdlib.h>
#include <jni.h>
#include "czmq.h"
#include "org_zeromq_czmq_Zlistx.h"

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1new (JNIEnv *env, jclass c)
{
    //  Disable CZMQ signal handling; allow Java to deal with it
    zsys_handler_set (NULL);
    jlong new_ = (jlong) (intptr_t) zlistx_new ();
    return new_;
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1destroy (JNIEnv *env, jclass c, jlong self)
{
    zlistx_destroy ((zlistx_t **) &self);
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1addStart (JNIEnv *env, jclass c, jlong self, jlong item)
{
    jlong add_start_ = (jlong) (intptr_t) zlistx_add_start ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) item);
    return add_start_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1addEnd (JNIEnv *env, jclass c, jlong self, jlong item)
{
    jlong add_end_ = (jlong) (intptr_t) zlistx_add_end ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) item);
    return add_end_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1size (JNIEnv *env, jclass c, jlong self)
{
    jlong size_ = (jlong) zlistx_size ((zlistx_t *) (intptr_t) self);
    return size_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1head (JNIEnv *env, jclass c, jlong self)
{
    jlong head_ = (jlong) (intptr_t) zlistx_head ((zlistx_t *) (intptr_t) self);
    return head_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1tail (JNIEnv *env, jclass c, jlong self)
{
    jlong tail_ = (jlong) (intptr_t) zlistx_tail ((zlistx_t *) (intptr_t) self);
    return tail_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1first (JNIEnv *env, jclass c, jlong self)
{
    jlong first_ = (jlong) (intptr_t) zlistx_first ((zlistx_t *) (intptr_t) self);
    return first_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1next (JNIEnv *env, jclass c, jlong self)
{
    jlong next_ = (jlong) (intptr_t) zlistx_next ((zlistx_t *) (intptr_t) self);
    return next_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1prev (JNIEnv *env, jclass c, jlong self)
{
    jlong prev_ = (jlong) (intptr_t) zlistx_prev ((zlistx_t *) (intptr_t) self);
    return prev_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1last (JNIEnv *env, jclass c, jlong self)
{
    jlong last_ = (jlong) (intptr_t) zlistx_last ((zlistx_t *) (intptr_t) self);
    return last_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1item (JNIEnv *env, jclass c, jlong self)
{
    jlong item_ = (jlong) (intptr_t) zlistx_item ((zlistx_t *) (intptr_t) self);
    return item_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1cursor (JNIEnv *env, jclass c, jlong self)
{
    jlong cursor_ = (jlong) (intptr_t) zlistx_cursor ((zlistx_t *) (intptr_t) self);
    return cursor_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1handleItem (JNIEnv *env, jclass c, jlong handle)
{
    jlong handle_item_ = (jlong) (intptr_t) zlistx_handle_item ((void *) (intptr_t) handle);
    return handle_item_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1find (JNIEnv *env, jclass c, jlong self, jlong item)
{
    jlong find_ = (jlong) (intptr_t) zlistx_find ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) item);
    return find_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1detach (JNIEnv *env, jclass c, jlong self, jlong handle)
{
    jlong detach_ = (jlong) (intptr_t) zlistx_detach ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) handle);
    return detach_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1detachCur (JNIEnv *env, jclass c, jlong self)
{
    jlong detach_cur_ = (jlong) (intptr_t) zlistx_detach_cur ((zlistx_t *) (intptr_t) self);
    return detach_cur_;
}

JNIEXPORT jint JNICALL
Java_org_zeromq_czmq_Zlistx__1_1delete (JNIEnv *env, jclass c, jlong self, jlong handle)
{
    jint delete_ = (jint) zlistx_delete ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) handle);
    return delete_;
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1moveStart (JNIEnv *env, jclass c, jlong self, jlong handle)
{
    zlistx_move_start ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) handle);
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1moveEnd (JNIEnv *env, jclass c, jlong self, jlong handle)
{
    zlistx_move_end ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) handle);
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1purge (JNIEnv *env, jclass c, jlong self)
{
    zlistx_purge ((zlistx_t *) (intptr_t) self);
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1sort (JNIEnv *env, jclass c, jlong self)
{
    zlistx_sort ((zlistx_t *) (intptr_t) self);
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1insert (JNIEnv *env, jclass c, jlong self, jlong item, jboolean low_value)
{
    jlong insert_ = (jlong) (intptr_t) zlistx_insert ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) item, (bool) low_value);
    return insert_;
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1reorder (JNIEnv *env, jclass c, jlong self, jlong handle, jboolean low_value)
{
    zlistx_reorder ((zlistx_t *) (intptr_t) self, (void *) (intptr_t) handle, (bool) low_value);
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Zlistx__1_1dup (JNIEnv *env, jclass c, jlong self)
{
    jlong dup_ = (jlong) (intptr_t) zlistx_dup ((zlistx_t *) (intptr_t) self);
    return dup_;
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Zlistx__1_1test (JNIEnv *env, jclass c, jboolean verbose)
{
    zlistx_test ((bool) verbose);
}

