# 🍏 Hackintosh Dell Precision 5550 (Comet Lake)

![macOS](https://img.shields.io/badge/macOS-Compatible-success?style=for-the-badge&logo=apple)
![OpenCore](https://img.shields.io/badge/OpenCore-Bootloader-blue?style=for-the-badge)
![SecureBoot](https://img.shields.io/badge/Secure%20Boot-Enabled-brightgreen?style=for-the-badge)

Questo repository contiene la configurazione EFI per installare e avviare macOS sul laptop **Dell Precision 5550** (equivalente al Dell XPS 15 9500), basato su architettura Intel di 10ª generazione (Comet Lake).

## 💻 Specifiche Hardware

| Componente | Modello |
| :--- | :--- |
| **Processore (CPU)** | Intel Core i7 (10th Gen Comet Lake) |
| **Grafica Integrata (iGPU)** | Intel UHD Graphics 630 |
| **Grafica Dedicata (dGPU)** | NVIDIA Quadro (Disabilitata via SSDT - Non supportata) |
| **Memoria (RAM)** | DDR4 |
| **Archiviazione** | NVMe SSD |
| **Audio** | Realtek ALC289 |
| **Wi-Fi / Bluetooth** | Intel AX201 |
| **Touchpad** | I2C HID |

---

## 🛠 Stato del Sistema (Cosa funziona)

- [x] Accelerazione Grafica (Intel UHD 630)
- [x] Audio interno e jack cuffie
- [x] Trackpad con gesture native Apple (I2C)
- [x] Wi-Fi e Bluetooth (Intel)
- [x] Gestione energetica (CPU Power Management e Sleep/Wake)
- [x] **Porte USB-C e Thunderbolt 3 (Mappatura Custom a 15 porte)**
- [x] **Uscita Video DisplayPort tramite Type-C (Hot-plug funzionante)**
- [x] **Dual Boot con Windows 11 (Vero Secure Boot Hardware Attivo)**
- [ ] GPU NVIDIA (Fisicamente incompatibile con macOS)

---

## ⚙️ Impostazioni del BIOS (F2 all'avvio)

Per far funzionare correttamente questa EFI, è fondamentale configurare il BIOS Dell nel seguente modo:

* **SATA Operation:** `AHCI` (Non RAID)
* **Fastboot:** `Minimal` o `Thorough`
* **Thunderbolt Configuration:**
    * Enable Thunderbolt Technology Support: `ON`
    * Enable Thunderbolt Adapter Pre-boot Modules: `ON`
    * Thunderbolt Security Level: `No Security`
* **USB PowerShare:** `ON`
* **Secure Boot:** `Enabled` *(Vedi nota sotto)*

---

## 🔐 Nota speciale sul Secure Boot e Dual Boot
Questa EFI è predisposta per il **Dual Boot sicuro con Windows 11**. 
Il sistema avvia OpenCore con il **Secure Boot del BIOS attivato**. Per replicare questo setup, è necessario generare le proprie chiavi crittografiche (`PK`, `KEK`, `db`), firmare i file `.efi` di OpenCore (tramite `osslsigncode` o `sbsigntool`) e iniettare le chiavi pubbliche nel BIOS Dell tramite la sezione *Expert Key Management*. 
Non abilitare il Secure Boot nel BIOS senza aver prima firmato i file, altrimenti il sistema non si avvierà.

---

## ⚠️ Disclaimer
*Questa EFI è condivisa a scopo puramente didattico. Non sono responsabile per eventuali danni hardware o perdite di dati. Assicurati di generare i tuoi SMBIOS (Seriale, Board ID, Mac Address) tramite GenSMBIOS prima di utilizzare questa cartella collegandoti ai servizi Apple.*

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# 🍏 Hackintosh Dell Precision 5550 (Comet Lake)

![macOS](https://img.shields.io/badge/macOS-Compatible-success?style=for-the-badge&logo=apple)
![OpenCore](https://img.shields.io/badge/OpenCore-Bootloader-blue?style=for-the-badge)
![SecureBoot](https://img.shields.io/badge/Secure%20Boot-Enabled-brightgreen?style=for-the-badge)

This repository contains the EFI configuration to install and boot macOS on the **Dell Precision 5550** laptop (equivalent to the Dell XPS 15 9500), based on the 10th generation Intel architecture (Comet Lake).

## 💻 Hardware Specifications

| Component | Model |
| :--- | :--- |
| **Processor (CPU)** | Intel Core i7 (10th Gen Comet Lake) |
| **Integrated Graphics (iGPU)** | Intel UHD Graphics 630 |
| **Dedicated Graphics (dGPU)** | NVIDIA Quadro (Disabled via SSDT - Unsupported) |
| **Memory (RAM)** | DDR4 |
| **Storage** | NVMe SSD |
| **Audio** | Realtek ALC289 |
| **Wi-Fi / Bluetooth** | Intel AX201 |
| **Touchpad** | I2C HID |

---

## 🛠 System Status (What works)

- [x] Graphics Acceleration (Intel UHD 630)
- [x] Internal Audio and Headphone Jack
- [x] Trackpad with native Apple gestures (I2C)
- [x] Wi-Fi and Bluetooth (Intel)
- [x] Power Management (CPU Power Management and Sleep/Wake)
- [x] **USB-C and Thunderbolt 3 ports (Custom 15-port mapping)**
- [x] **DisplayPort Video Output via Type-C (Working Hot-plug)**
- [x] **Dual Boot with Windows 11 (True Hardware Secure Boot Enabled)**
- [ ] NVIDIA GPU (Physically incompatible with macOS)

---

## ⚙️ BIOS Settings (F2 at boot)

To make this EFI work correctly, it is essential to configure the Dell BIOS as follows:

* **SATA Operation:** `AHCI` (Not RAID)
* **Fastboot:** `Minimal` or `Thorough`
* **Thunderbolt Configuration:**
    * Enable Thunderbolt Technology Support: `ON`
    * Enable Thunderbolt Adapter Pre-boot Modules: `ON`
    * Thunderbolt Security Level: `No Security`
* **USB PowerShare:** `ON`
* **Secure Boot:** `Enabled` *(See note below)*

---

## 🔐 Special Note on Secure Boot and Dual Boot
This EFI is prepared for **Secure Dual Boot with Windows 11**. 
The system boots OpenCore with the **BIOS Secure Boot enabled**. To replicate this setup, you must generate your own cryptographic keys (`PK`, `KEK`, `db`), sign the OpenCore `.efi` files (using `osslsigncode` or `sbsigntool`), and inject the public keys into the Dell BIOS via the *Expert Key Management* section. 
Do not enable Secure Boot in the BIOS without signing the files first, otherwise the system will fail to boot.

---

## ⚠️ Disclaimer
*This EFI is shared for educational purposes only. I am not responsible for any hardware damage or data loss. Make sure to generate your own SMBIOS (Serial, Board ID, Mac Address) using GenSMBIOS before using this folder and connecting to Apple services.*
