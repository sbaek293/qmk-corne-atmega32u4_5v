# qmk-corne-atmega32u4_5v

Corne(crkbd)용 QMK 키맵입니다.

## 요구사항 반영 내용

- 42키 / 36키 배열을 `KEY_LAYOUT` 빌드 옵션으로 선택 가능
- MCU: `atmega32u4` 명시
- 좌/우 분할 연결: TRS(시리얼 split transport) 설정 명시

## 빌드 예시

QMK Firmware 루트에서 아래처럼 빌드합니다.

### 42키 (기본값)

```bash
qmk compile -kb crkbd/rev1 -km sbaek293
```

또는 명시적으로:

```bash
qmk compile -kb crkbd/rev1 -km sbaek293 -e KEY_LAYOUT=42
```

### 36키

```bash
qmk compile -kb crkbd/rev1 -km sbaek293 -e KEY_LAYOUT=36
```

## 파일 위치

- `keyboards/crkbd/keymaps/sbaek293/keymap.c`
- `keyboards/crkbd/keymaps/sbaek293/rules.mk`
- `keyboards/crkbd/keymaps/sbaek293/config.h`

## 라이선스

이 저장소는 [MIT License](./LICENSE)를 따릅니다.
