#pragma once

#define EE_HANDS
#define USE_SERIAL
#define SOFT_SERIAL_PIN D2

/* RGB Light
 * 5V ATmega32U4 + WS2812: 5V 전원으로 직접 구동 가능.
 * USB 500mA 한도를 고려해 최대 밝기를 150/255 로 제한. */
#define RGBLIGHT_SLEEP
#define RGBLIGHT_LIMIT_VAL 150
#define RGBLIGHT_EFFECT_BREATHING
#define RGBLIGHT_EFFECT_RAINBOW_SWIRL
#define RGBLIGHT_EFFECT_STATIC_GRADIENT

/* OLED (SSD1306 128x32, I2C)
 * 마스터: Luna 키보드 펫 + 레이어 아이콘 + 모디파이어 아이콘 (PandaKBLab 참조)
 *         OLED_ROTATION_270 (세로 portrait 장착)
 * 슬레이브: 공식 Corne (crkbd) 로고 raw 비트맵
 *           OLED_ROTATION_0 (가로 landscape 장착)
 * 폰트: 커스텀 glcdfont (레이어/모디파이어 픽토그램 포함, 마스터 전용) */
#define OLED_TIMEOUT 30000
#define OLED_FONT_H "keyboards/crkbd/keymaps/sbaek293/lib/glcdfont.c"

/* Vial — dynamic keymap support (vial-qmk 빌드 시 유효)
 * UID는 키보드마다 고유해야 합니다.
 * 언락 콤보: 좌측 최상단(0,0) + 우측 최상단(4,0) */
#define VIAL_KEYBOARD_UID {0xA4, 0x7D, 0x3B, 0x9E, 0x56, 0x21, 0xC8, 0x0F}
#define VIAL_UNLOCK_COMBO_ROWS {0, 4}
#define VIAL_UNLOCK_COMBO_COLS {0, 0}
#define DYNAMIC_KEYMAP_LAYER_COUNT 4
