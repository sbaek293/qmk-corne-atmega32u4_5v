MCU = atmega32u4
BOOTLOADER = caterina

SPLIT_KEYBOARD = yes
SPLIT_TRANSPORT = serial

RGBLIGHT_ENABLE = yes
OLED_ENABLE = yes
WPM_ENABLE = yes
VIAL_ENABLE = yes

ifeq ($(KEY_LAYOUT),)
    OPT_DEFS += -DCORNE_LAYOUT_42
else ifeq ($(KEY_LAYOUT),42)
    OPT_DEFS += -DCORNE_LAYOUT_42
else ifeq ($(KEY_LAYOUT),36)
    OPT_DEFS += -DCORNE_LAYOUT_36
else
    $(error KEY_LAYOUT must be 42 or 36)
endif
