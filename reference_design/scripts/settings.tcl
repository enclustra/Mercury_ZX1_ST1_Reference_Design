# ----------------------------------------------------------------------------------
# Copyright (c) 2022 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------

# Project settings for Mercury ZX1 Reference Design
# Valid module codes
# ME-ZX1-45-2I-D10-P
# ME-ZX1-30-2I-D10
# ME-ZX1-35-1I-D10

# ----------------------------------------------------------------------------------
# Modify this variable to select your module
if {![info exists module_name]} {set module_name ME-ZX1-45-2I-D10-P}
if {![info exists baseboard]}   {set baseboard ST1}
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Don't modify anything beyond this line
# ----------------------------------------------------------------------------------

#if any file argument are present, use this value
if {[lindex $argv 0] != ""} { set module_name [lindex $argv 0] }

set module Mercury_ZX1
set family zynq

switch $module_name {
  ME-ZX1-45-2I-D10-P {
    set part xc7z045ffg676-2 
    set CPU_FREQ 2I
    set PL_DDR 45-2I-D10
    set MGT_routing B111
  }
  ME-ZX1-30-2I-D10 {
    set part xc7z030fbg676-2 
    set CPU_FREQ 2I
    set PL_DDR 30-2I-D10
    set MGT_routing IO
  }
  ME-ZX1-35-1I-D10 {
    set part xc7z035fbg676-1 
    set CPU_FREQ 1I
    set PL_DDR 35-1I-D10
    set MGT_routing B111
  }
  default {
    puts "$module_name not available"
    break
  }
}

#create project name for design
if {![info exists project_name]} {
  set project_name ${module}
  if {[info exists baseboard]} {
    lappend project_name ${baseboard}
  }
  set project_name [string map {" " "_"} "${project_name}"]
}

puts "INFO: settings.tcl file loaded."
