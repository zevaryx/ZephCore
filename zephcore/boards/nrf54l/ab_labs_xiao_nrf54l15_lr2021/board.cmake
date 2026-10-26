# Copyright (c) 2026 ZephCore
# SPDX-License-Identifier: MIT
#
# The nRF54L15 has no USB peripheral and this board has no bootloader. The
# XIAO's USB-C goes to a SAMD11 that presents CMSIS-DAP (SWD) and a USB CDC for
# the uart20 console, so openocd over CMSIS-DAP is the default flash path.
# support/openocd.cfg is Zephyr's XIAO nRF54L15 config.

board_runner_args(openocd "--cmd-load=nrf54l-load" -c "targets nrf54l.cpu")
board_runner_args(jlink "--device=nRF54L15_M33" "--speed=4000")

include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/nrfutil.board.cmake)
include(${ZEPHYR_BASE}/boards/common/nrfjprog.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
