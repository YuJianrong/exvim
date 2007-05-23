# Copyright (C) 2006 Johnny
# ayacai [at] 163 [dot] com

# ----------------------------------------------------------
#  User Define
# ----------------------------------------------------------

# Parent Working Directory
PWD := # relative-address (sample: ..)

# Project Name
Project := # current directory name
ProjectType := # choose: a,lib,so,dll,exe

# Include Path
IncDirs += # relative-address (sample: ./Incs)

# Precompiled Headers Dependence Headers
FullPath_PchDeps += # relative-address/header-file-name (sample: ./Incs/pch-header.h)

# Source Path
SrcDirs += # relative-address (sample: ./Srcs)

# Dependent Libaray File Paths
LibDirs += # relative-address (sample: ../Third-Part-Libs)

# Dependent Libaray File Names
Libs += # lib-file-name (sample: libSDK.lib-->SDK)

# Special Flags
# Some space-depent directory flag can't generate automatically, use this instead
CFlag_Spec += # (sample: -I"C:/Program Files/Microsoft DirectX SDK/Include")
LFlag_Spec += # (sample: -L"C:/Program Files/Microsoft DirectX SDK/Lib/x86")

# include general config
# (sample: include ../config.mk)
include ../config.mk

# ----------------------------------------------------------
#  Addvance User Define
# ----------------------------------------------------------

# Parent Working Directory
PWD ?= ..
OutDir := $(PWD)/_gmakes

# After Build Even
AFTER_BUILD = # programme after target been built, this is the project specific one (sample: make_fself $(@) $(basename $(@)).self)

# ----------------------------------------------------------
#  Rules
# ----------------------------------------------------------

include ../rule.mk
