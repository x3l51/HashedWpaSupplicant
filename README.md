If you use raspbian for a raspberry pi headless, you will most likely set you WiFi information via
`raspi-config` or directly with an editor in `wpa_supplicant.conf`. The problem: Both options will
have you put in your network password in clear text.

This scipt automatically hashes your password and creates the `wpa_supplicant.conf` or appends to
it, if it already exists.


Usage:
```
$:~/testing/HashedWpaSupplicant$ sudo bash HashedWpaSupplicant.sh

***Generate new wpa_supplicant.conf with hashed password***

Type the SSID of the network you want to connect to and press [ENTER]:

TEST_SSID

Type the PASSWORD of the network you want to connect to and press [ENTER]:

TEST_PASSWORD

Wpa_supplicant.conf successfully generated
```

`Wpa_supplicant.conf` looks like this:
```
$:~/testing/HashedWpaSupplicant$ sudo cat wpa_supplicant.conf
network={
        ssid="SSID"
        psk=c2161655c6ba444d8df94cbbf4e9c5c4c61fc37702b9c66ed37aee1545a5a333
}
```
