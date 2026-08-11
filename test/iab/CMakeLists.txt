include("${CMAKE_CURRENT_SOURCE_DIR}/../testing.cmake")

setup_test_dir("iab")

# Mux+demux test for IAB immersive audio sound essence (SMPTE ST 2067-201).
set(tests
    1
)

foreach(test ${tests})
    set(args
        "${common_args}"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/test_${test}.cmake"
    )
    setup_test("iab" "bmx_iab_${test}" "${args}")
endforeach()
