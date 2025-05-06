cmake_minimum_required(VERSION 3.10)
project(MagicCarpet LANGUAGES NONE)

# Find required tools
find_program(CA65 ca65 REQUIRED)
find_program(LD65 ld65 REQUIRED)

# Set paths
set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/source")
set(BUILD_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build")
set(ROM_DIR "${CMAKE_CURRENT_SOURCE_DIR}/rom")
set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")

# Create output directories
file(MAKE_DIRECTORY ${BUILD_DIR})
file(MAKE_DIRECTORY ${ROM_DIR})

# Main assembly file
set(MAIN_ASM "${SOURCE_DIR}/main.asm")
set(MAIN_OBJ "${BUILD_DIR}/main.o")
set(OUTPUT_ROM "${ROM_DIR}/MagicCarpet.nes")
set(OUTPUT_DBG "${ROM_DIR}/MagicCarpet.dbg")
set(CONFIG_FILE "${SOURCE_DIR}/config/mapper003.cfg")

# Custom command to assemble main.asm
add_custom_command(
    OUTPUT ${MAIN_OBJ}
    COMMAND ${CA65} ${MAIN_ASM} -o ${MAIN_OBJ} --debug-info -I${INCLUDE_DIR}
    DEPENDS ${MAIN_ASM}
    COMMENT "Assembling main.asm"
)

# Custom command to link the ROM
add_custom_command(
    OUTPUT ${OUTPUT_ROM} ${OUTPUT_DBG}
    COMMAND ${LD65} ${MAIN_OBJ} -o ${OUTPUT_ROM} -C ${CONFIG_FILE} --dbgfile ${OUTPUT_DBG}
    DEPENDS ${MAIN_OBJ} ${CONFIG_FILE}
    COMMENT "Linking MagicCarpet.nes"
)

# Custom target for building the ROM
add_custom_target(rom ALL DEPENDS ${OUTPUT_ROM})

# Clean target
add_custom_target(clean_build
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${BUILD_DIR}
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BUILD_DIR}
    COMMENT "Cleaning build directory"
)