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
 * 슬레이브 측: crkbd 로고, 마스터 측: 레이어·키 로그 표시
 * (crkbd.c의 oled_task_kb() 기본 구현 사용) */
#define OLED_TIMEOUT 30000
