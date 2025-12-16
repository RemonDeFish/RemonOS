# Catatan Kustomisasi Kernel

Kustomisasi kernel pada distro ini difokuskan pada:
- Keamanan dasar sistem
- Stabilitas pada penggunaan bersama (laboratorium)
- Optimasi ringan tanpa recompiling kernel penuh

## Metode
- Tidak melakukan rebuild kernel penuh
- Menggunakan konfigurasi boot parameter dan sysctl
- Mudah direproduksi dan dipelihara

## Dampak
- Sistem lebih aman terhadap konfigurasi jaringan berbahaya
- Boot lebih cepat pada mode live
- Cocok untuk komputer lab dengan spesifikasi menengah

## Alasan Tidak Recompile Kernel
- Fokus proyek adalah remastering distro
- Menghindari risiko inkompatibilitas hardware
- Lebih relevan untuk implementasi pendidikan
