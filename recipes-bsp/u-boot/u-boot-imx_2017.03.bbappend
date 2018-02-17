# Copyright (C) 2018 Emcraft Systems

# This appends to meta-fsl-bsp-release/imx/meta-bsp/recipes-bsp/u-boot/u-boot-imx_2017.03.bb

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DESCRIPTION = "i.MX U-Boot suppporting Emcraft IMX8M-SOM board."
SRC_URI = "${CONFIG_SRC_URI_UBOOT}"

S = "${CONFIG_UBOOT_S}"
SRCREV = "${CONFIG_UBOOT_GIT_REV}"

SCMVERSION = "n"

do_deploy_append_mx8mq () {
    # Deploy the mkimage, u-boot-nodtb.bin and emcraft-imx8m-som.dtb for mkimage to generate boot binary
    if [ -n "${UBOOT_CONFIG}" ]
    then
        for config in ${UBOOT_MACHINE}; do
            i=$(expr $i + 1);
            for type in ${UBOOT_CONFIG}; do
                j=$(expr $j + 1);
                if [ $j -eq $i ]
                then
                    install -d ${DEPLOYDIR}/${BOOT_TOOLS}
                    install -m 0777 ${B}/${config}/arch/arm/dts/emcraft-imx8m-som.dtb  ${DEPLOYDIR}/${BOOT_TOOLS}/
                    install -m 0777 ${B}/${config}/tools/mkimage  ${DEPLOYDIR}/${BOOT_TOOLS}/mkimage_uboot
                    install -m 0777 ${B}/${config}/u-boot-nodtb.bin  ${DEPLOYDIR}/${BOOT_TOOLS}
                fi
            done
            unset  j
        done
        unset  i
    fi

}
