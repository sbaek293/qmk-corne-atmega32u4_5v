# qmk-corne-atmega32u4_5v

Corne(crkbd)용 QMK 키맵입니다.

## 요구사항 반영 내용

- 42키 / 36키 배열을 `KEY_LAYOUT` 빌드 옵션으로 선택 가능
- MCU: `atmega32u4` (5V) 명시
- 좌/우 분할 연결: TRS(시리얼 split transport) 설정 명시
- **RGB 언더글로우 LED** (WS2812, 한쪽 27개 / 전체 54개): 5V 직접 구동
- **OLED 디스플레이** (SSD1306 128×32, I2C): 마스터는 레이어·키 로그, 슬레이브는 crkbd 로고 표시

## 하드웨어 정보

| 항목 | 내용 |
|------|------|
| MCU | ATmega32U4 (5V) |
| 부트로더 | Caterina |
| 분할 연결 | TRS 시리얼 (`D2` 핀) |
| RGB LED | WS2812B, `D3` 핀, 27개×2 = 54개 |
| OLED | SSD1306 128×32, I2C (`D0`/`D1`) |

### 5V 전원 안전 설정

- WS2812B는 5V 네이티브 소자이므로 레벨 시프터 없이 ATmega32U4와 직결 가능
- USB 500 mA 한도를 고려해 최대 LED 밝기를 `RGBLIGHT_LIMIT_VAL 150`(~59%)으로 제한
- suspend 진입 시 LED 자동 소등 (`RGBLIGHT_SLEEP`)
- OLED 30초 자동 꺼짐 (`OLED_TIMEOUT 30000`)

### OLED 동작

| 반쪽 | 표시 내용 |
|------|-----------|
| 마스터 | 현재 레이어 이름 + 마지막 입력 키 로그 |
| 슬레이브 | crkbd 로고 (180° 회전) |

> 구현 출처: [keyboards/crkbd/crkbd.c](https://github.com/qmk/qmk_firmware/blob/master/keyboards/crkbd/crkbd.c) (QMK 공식)

### 활성화된 RGB 애니메이션

- Breathing (숨쉬기)
- Rainbow Swirl (레인보우 소용돌이)
- Static Gradient (정적 그라디언트)

## 로컬 풀 빌드

이 저장소 단독으로 빌드할 수 있도록 `vial-qmk` 소스를 `third_party/vial-qmk`에 자동으로 내려받아 빌드합니다.

- `qmk` CLI가 설치되어 있으면 로컬 도구체인으로 빌드
- `qmk` CLI가 없으면 Docker(`qmkfm/qmk_cli` 이미지)로 빌드

### 42키 (기본값)

```bash
make build-42
```

### 36키

```bash
make build-36
```

### 42/36 전체 빌드

```bash
make build-all
```

> 참고: 첫 빌드 시 `scripts/bootstrap_qmk.sh`가 `vial-qmk`(submodule 포함)를 `third_party/vial-qmk`로 클론합니다.

## 파일 위치

- `keyboards/crkbd/keymaps/sbaek293/keymap.c`
- `keyboards/crkbd/keymaps/sbaek293/rules.mk`
- `keyboards/crkbd/keymaps/sbaek293/config.h`

## 라이선스

이 저장소는 [MIT License](./LICENSE)를 따릅니다.
