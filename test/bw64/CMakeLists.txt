include("${CMAKE_CURRENT_SOURCE_DIR}/../testing.cmake")

setup_test_dir("bw64")

# Mux+demux test for Serial ADM (S-ADM) sound essence from a BW64 file
# (ITU-R BS.2088, SMPTE ST 2127-1).
set(tests
    1
)

foreach(test ${tests})
    set(args
        "${common_args}"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/test_${test}.cmake"
    )
    setup_test("bw64" "bmx_bw64_${test}" "${args}")
endforeach()
