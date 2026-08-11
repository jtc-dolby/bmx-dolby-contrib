# Test creating (mux) and reading (demux) an op1a MXF file with IAB (Immersive
# Audio Bitstream, SMPTE ST 2067-201) sound essence. Uses --regtest-real
# because the input is real essence.

include("${TEST_SOURCE_DIR}/../testing.cmake")


if(TEST_MODE STREQUAL "samples")
    file(MAKE_DIRECTORY ${BMX_TEST_SAMPLES_DIR})
endif()


if(TEST_MODE STREQUAL "check")
    set(output_file test_1.mxf)
    set(output_info_file info_1.xml)
elseif(TEST_MODE STREQUAL "samples")
    set(output_file ${BMX_TEST_SAMPLES_DIR}/test_1.mxf)
    set(output_info_file ${BMX_TEST_SAMPLES_DIR}/info_1.xml)
else()
    set(output_file test_1.mxf)
    set(output_info_file ${TEST_SOURCE_DIR}/info_1.xml.bin)
endif()

set(create_command ${RAW2BMX}
    --regtest-real
    -t op1a
    -o ${output_file}
    --iab "${TEST_SOURCE_DIR}/test_1_iab/test_1.iab"
)

set(read_command ${MXF2RAW}
    --regtest
    --info
    --info-format xml
    --info-file ${output_info_file}
    ${output_file}
)

run_test_a(
    "${TEST_MODE}"
    "${BMX_TEST_WITH_VALGRIND}"
    ""
    ""
    ""
    "${create_command}"
    ""
    ""
    "${read_command}"
    "${output_file}"
    "test_1.md5"
    "${output_info_file};info_1.xml.bin"
    ""
)
