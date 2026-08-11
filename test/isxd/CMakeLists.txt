include("${CMAKE_CURRENT_SOURCE_DIR}/../testing.cmake")

setup_test_dir("isxd")

# Mux+demux test for ISXD data essence (SMPTE ST 2067-202).
set(tests
    1
)

foreach(test ${tests})
    set(args
        "${common_args}"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/test_${test}.cmake"
    )
    setup_test("isxd" "bmx_isxd_${test}" "${args}")
endforeach()
