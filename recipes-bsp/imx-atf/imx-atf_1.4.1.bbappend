# Copyright (C) 2018 Emcraft Systems

# This appends to meta-fsl-bsp-release/imx/meta-bsp/recipes-bsp/imx-atf/imx-atf_1.4.1.bb
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " file://imx-atf-disable-lpddr4-init.patch "