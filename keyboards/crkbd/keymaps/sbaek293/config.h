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
 * 슬레이브: PandaKBLab 로고 이미지
 * 폰트: 커스텀 glcdfont (레이어/모디파이어 픽토그램 포함)
 * OLED_ROTATION_270 = 세로 장착(portrait) 기준 */
#define OLED_TIMEOUT 30000
#define OLED_FONT_H "keyboards/crkbd/keymaps/sbaek293/lib/glcdfont.c"
