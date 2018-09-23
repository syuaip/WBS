# WBS
Warnet Billing System 0.5.1.a (Juli 2001)

BENDA APAKAH INI ?
------------------

Benda ini berguna untuk mencatat biaya yang akan anda tagihkan kepada kastemer
untuk usaha Warnet atau Rental Komputer.


FITUR:
------
- Menghitung Biaya per jam (dengan hitungan per menit dan sistem bayar 
  minimal, seperti argo taksi) 
- Mendukung multi rate (bisa di-set biaya untuk group Guest, Member, 
  Admin, dan VIP Member) 
- Sisi Client dibuat se-secure mungkin (Start Button, Ctr-Alt-Del, 
  Screen Properties dan Alt-Tab di-disable) 
- Jam di semua client akan persis sama dengan jam di server (agar 
  tidak ada dispute soal waktu) 
- Di server operator bisa memonitor lama dan biaya penggunaan di user, 
  kemudian operator bisa melakukan logout client dari komputer server 
- Operator di server bisa melakukan reboot atau shutdown secara remote 
  terhadap klien 
- Report ditulis ke database (MsAccess 2000), sehingga bisa dibuat report 
  melalui fasilitas Report generator MsAccess 


KEBUTUHAN SISTEM:
-----------------

- Billing Server 
  ~ Windows 9x/Me/NT/2000 
  ~ Free space sebesar 10MB untuk instalasi, 
    ditambah sekitar 30MB perbulan untuk data transaksi dan log.
  ~ Jaringan dengan protokol TCP/IP

- Billing Client 
  ~ Windows 9x/Me 
  ~ Free space sebesar 2MB 
  ~ Jaringan dengan protokol TCP/IP 


INSTALASI BINARY:
-----------------

SERVER : 
- Download dari <address no longer valid>
- Extract ke C:\wServerInstall 
- Run file C:\wServerInstall\SETUP.EXE 
- Ikuti prosedurnya 
- Ke Control Panel, klik ODBC, Pilih Server DSN dan buat entry 
  'wServer' dengan menunjuk ke file 'C:\Program Files\wServer\wserva1.mdb' 
- Jalankan wServer melalui Start Menu 
- Login sebagai ADMIN (password default = ADMIN)
- Isi daftar PC Client beserta IP Addressnya 
- Edit Daftar USER dengan mengisikan sejumlah OPERATOR Warnet anda
- Login sebagai OPERATOR
- Edit Daftar MEMBER dari Warnet anda
- That's It! 

CLIENT : 
- Download dari <address no longer valid> 
- Extract ke C:\wClientInstall 
- Run file C:\wClientInstall\SETUP.EXE 
- Ikuti prosedurnya 
- Pilih Yes saat muncul pilihan untuk Restart 
- Tunggu saat PC Client rebooting 
- Saat wClient pertama kali di-load, isi alamat IP Server, kemudian 
- Isi alamat default Search Engine dan Start Page untuk IE 
- That's It! 


REGISTRASI:
-----------
Untuk mendapatkan Serial Number, silahkan lakukan hal-hal berikut : 

- Install Warnet Billing Server di komputer server anda 
- Melalui menu Help|Register, catat Customer ID yang digenerate oleh WBS 
- Kemudian silahkan kirimi saya melalui email <address no longer valid> item-item berikut : 
  ~ Customer Name yang anda inginkan (Sebaiknya nama warnet atau usaha anda)
  ~ Customer ID dari aplikasi WBS tersebut 
  ~ Alamat dari Warnet anda 
  ~ Nomor Telpon anda untuk jika saya perlu melakukan konfirmasi atau jika ada 
    kekurangan dari apa yang anda kirim via email. 

Secepatnya akan saya kirim Serial Number ke email anda untuk segera dapat anda gunakan.


PERTANYAAN DAN BUG:
-------------------
Jika ada pertanyaan atau kutu, silahkan lempar email ke <address no longer valid>


DISKLAIMER:
-----------
Perangkat lunak ini disediakan 'apa-adanya', tanpa garansi apapun.
Penulis tidak mempunyai kewajiban apapun atas penggunaan perangkat ini oleh siapapun.

...artinya...

Program WBS sudah digunakan tanpa masalah di lebih dari 20 Warnet di Indonesia, 
dan jika kebetulan ada 'kutu' di program ini yang membuat komputer anda meledak 
dan/atau tempat tinggal anda kemudian terbakar habis, tanggung jawab atas
kejadian-kejadian tersebut bukan pada penulis.


NOTE: Karena program ini sudah diletakkan di GitHub, berikut adalah detail cara kompilasinya.


KOMPILASI:
----------
- Alat kompilasi: Windows 2000, Delphi 5
- Server: TBD.
- Client: TBD.
- Database: TBD.


Best Regards,

AWN
