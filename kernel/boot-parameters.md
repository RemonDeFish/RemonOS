# Kernel Boot Parameters

Distro ini menggunakan kustomisasi parameter boot kernel
untuk meningkatkan stabilitas, keamanan, dan kenyamanan
penggunaan pada lingkungan laboratorium komputer.

## Parameter yang Digunakan

1. quiet splash
   - Mengurangi pesan verbose saat boot
   - Tampilan lebih bersih dan profesional untuk lab

2. security=apparmor
   - Mengaktifkan AppArmor sebagai sistem Mandatory Access Control
   - Meningkatkan keamanan aplikasi di lingkungan multi-user

3. mitigations=auto
   - Mengaktifkan mitigasi kerentanan CPU secara otomatis
   - Menjaga keseimbangan antara keamanan dan performa

4. fsck.mode=skip
   - Melewati pemeriksaan filesystem saat live boot
   - Mempercepat proses boot pada mode live

## Alasan Kustomisasi
Parameter ini dipilih untuk memastikan sistem:
- Stabil saat digunakan oleh banyak user
- Aman untuk lingkungan pendidikan
- Cepat saat live boot di laboratorium
