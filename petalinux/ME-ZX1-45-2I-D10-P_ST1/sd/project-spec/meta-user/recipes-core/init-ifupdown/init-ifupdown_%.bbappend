SRC_URI += " \
        file://interfaces_single_eth \
        "
  
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
     install -m 0644 ${WORKDIR}/interfaces_single_eth ${D}${sysconfdir}/network/interfaces
}
