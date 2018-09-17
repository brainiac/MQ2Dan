################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

#   gyp --depth=.
{
    'target_defaults': {
        'default_configuration': 'Debug',
        'configurations': {
            'Debug': {
                'defines': [ 'DEBUG', '_DEBUG' ],
                'msvs_settings': {
                    'VCCLCompilerTool': {
                        'RuntimeLibrary': 1, # static debug
                    },
                },
            },
            'Release': {
                'defines': [ 'NDEBUG' ],
                'msvs_settings': {
                    'VCCLCompilerTool': {
                        'RuntimeLibrary': 0, # static release
                    },
                },
            }
        },
        'msvs_settings': {
            'VCLinkerTool': {
                'GenerateDebugInformation': 'true',
            },
        },
    },
    'include_dirs': [
        'include'
    ],
    'targets': [
      {
        'target_name': 'libczmq',
        'type': 'static_library',
        'sources': [
            'src/zactor.c',
            'src/zarmour.c',
            'src/zauth.c',
            'src/zauth_v2.c',
            'src/zbeacon.c',
            'src/zbeacon_v2.c',
            'src/zcert.c',
            'src/zcertstore.c',
            'src/zchunk.c',
            'src/zclock.c',
            'src/zconfig.c',
            'src/zctx.c',
            'src/zdigest.c',
            'src/zdir.c',
            'src/zdir_patch.c',
            'src/zfile.c',
            'src/zframe.c',
            'src/zgossip.c',
            'src/zgossip_msg.c',
            'src/zhash.c',
            'src/zhashx.c',
            'src/ziflist.c',
            'src/zlist.c',
            'src/zlistx.c',
            'src/zloop.c',
            'src/zmonitor.c',
            'src/zmonitor_v2.c',
            'src/zmsg.c',
            'src/zmutex.c',
            'src/zpoller.c',
            'src/zproc.c',
            'src/zproxy.c',
            'src/zproxy_v2.c',
            'src/zrex.c',
            'src/zsock.c',
            'src/zsocket.c',
            'src/zsockopt.c',
            'src/zstr.c',
            'src/zsys.c',
            'src/zthread.c',
            'src/ztrie.c',
            'src/zuuid.c'
        ]
      },
      {
        'target_name': 'zmakecert',
        'type': 'executable',
        'sources': [
            'src/zmakecert.c'
        ],
        'dependencies': [
            'libczmq'
        ],
        'libraries': [
            '-lsodium',
            '-lzmq',
            '-luuid',
            '-lsystemd',
            '-lpthread'
        ]
      },
      {
        'target_name': 'czmq_selftest',
        'type': 'executable',
        'sources': [
            'src/czmq_selftest.c'
        ],
        'dependencies': [
            'libczmq'
        ],
        'libraries': [
            '-lsodium',
            '-lzmq',
            '-luuid',
            '-lsystemd',
            '-lpthread'
        ]
      }
    ]
}
