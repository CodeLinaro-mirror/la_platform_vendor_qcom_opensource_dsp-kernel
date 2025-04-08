FASTRPC_DLKM_ENABLED := true

ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
	ifeq ($(TARGET_KERNEL_DLKM_FASTRPC_OVERRIDE), false)
		FASTRPC_DLKM_ENABLED := false
	endif
endif

ifeq ($(FASTRPC_DLKM_ENABLED), true)
ifeq ($(call is-board-platform-in-list,$(TARGET_BOARD_PLATFORM)),true)
ifneq ($(ENABLE_HYP), true)
BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/fastrpc-dsp.ko
endif
endif
endif
