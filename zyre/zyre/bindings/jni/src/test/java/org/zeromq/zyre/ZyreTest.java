/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
package org.zeromq.zyre;

import org.junit.Assert;
import org.junit.Test;

public class ZyreTest {
    static {
        try {
            System.loadLibrary ("zyrejni");
        }
        catch (Exception e) {
            System.exit (-1);
        }
    }
    @Test
    public void test () {
        Zyre.test (false);
    }
}
