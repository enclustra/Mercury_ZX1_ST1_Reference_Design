SRC_URI += " \
        file://interfaces_single_eth \
        "

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
     install -m 0644 ${WORKDIR}/interfaces_single_eth ${D}${sysconfdir}/network/interfaces
}
