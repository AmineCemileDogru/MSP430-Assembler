# MSP430 Assembler – Token Ayrıştırmalı

Bu proje, MSP430 mimarisi için geliştirilmiş bir **assembler (derleyici) ve yükleyici (linker/loader)** simülatörüdür. Kullanıcı dostu bir **Tkinter tabanlı GUI (grafik arayüz)** ile assembly kodlarını yazabilir, makine koduna çevirebilir, sembol tablosunu ve sanal bellek durumunu detaylı şekilde inceleyebilirsiniz.

## 🚀 Özellikler

- MSP430 komutlarını tanır (MOV, ADD, CALL, JMP vb.)
- `.macro`, `.endm` ile makro tanımları
- `.text`, `.data`, `.bss` ve `.usect` gibi segment destekleri
- Sembol tablosu ve relocation işlemleri
- Token ayrıştırmalı makine kodu görünümü
- Hex formatında **sanal bellek gözlemi**
- Çok sayfalı kod düzenleme desteği
- `.objtxt` biçiminde nesne dosyası üretimi ve yükleme

## 📦 Kurulum

### Gerekli Modüller
Python 3.7+ yüklü olmalıdır. Ek modül gerekmez çünkü yalnızca `tkinter` kullanılmıştır (Python ile birlikte gelir).

Aşağıdaki komutla tkinter kurulu değilse yükleyebilirsiniz:

```bash
sudo apt-get install python3-tk   # Linux
```

```bash
pip install tk                    # Windows (gerekirse)
```

## 🔧 Kullanım

### 1. Projeyi Çalıştırın

```bash
python gui.py
```

### 2. Arayüzü Tanıyın

- **Kod Alanı**: MSP430 assembly kodlarını yazabileceğiniz bölüm.
- **Çevir (F5)**: Kodu derler, objtxt dosyası üretir ve analizleri başlatır.
- **Belleği Göster**: Sanal bellek dump’ını 16-byte satırlar halinde gösterir.
- **ESTAB**: Control Section tablosu ve sembol adres bilgilerini gösterir.
- **Makro Tanımları**: Yazdığınız `.macro` blokları otomatik tanımlanır.
- **Makine Kodu Paneli**: Komutların adres, opcode, operand ve binary değerleriyle gösterimi yapılır.

### 3. Kod Örneği

```assembly
.text 0x1100
.global start

start:
    MOV #msg, R4        ; Immediate adres -> relocation
    CALL func           ; External sembol
    JMP end_label       ; Jump relocation

.data 0x0200
msg:   .word var1
var1:  .word 0x1234

func:
end_label:
```

## 📁 Proje Yapısı

```
📦 MSP430-Assembler
├── assembler.py        # Parser, sembol tablosu, opcode üretimi
├── gui.py              # Tkinter tabanlı kullanıcı arayüzü
├── linking_loader.py   # .objtxt yükleyici, bellek modellemesi
├── output.objtxt       # Üretilen nesne dosyası
└── README.md
```

## 🧠 Geliştirici Bilgisi

Bu sistem, MSP430 işlemcisi mimarisi için eğitim ve analiz amaçlı geliştirilmiştir. Herhangi bir fiziksel donanım gerektirmez ve tüm işlemler yazılım ortamında simüle edilmiştir.

## 📌 Notlar

- `.objtxt` dosyası her “Çevir” işleminden sonra otomatik üretilir.
- Bellek sadece geçerli segment adresleri (text/data/bss) içinde yazılır.
- Her sembolün adresi `symbol_table` içinden dinamik olarak elde edilir.

## 📬 İletişim

Bu proje hakkında soru veya katkı için lütfen proje sahibiyle iletişime geçiniz.
