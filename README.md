If you use raspbian for a raspberry pi headless, you will most likely set you WiFi information via
`raspi-config` or directly with an editor in `wpa_supplicant.conf`. The problem: Both options will
have you put in your network password in clear text.

This scipt automatically hashes your password and creates the `wpa_supplicant.conf` or appends to
it, if it already exists.


Download the script:
```
$ sudo wget https://raw.githubusercontent.com/x3l51/HashedWpaSupplicant/master/HashedWpaSupplicant.sh

--2019-01-31 10:01:43--  https://raw.githubusercontent.com/x3l51/HashedWpaSupplicant/master/HashedWpaSupplicant.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.112.133
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.112.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 795 [text/plain]
Saving to: ‘HashedWpaSupplicant.sh’

HashedWpaSupplicant.sh        100%[==============================================>]     795  --.-KB/s    in 0s

2019-01-31 10:01:43 (107 MB/s) - ‘HashedWpaSupplicant.sh’ saved [795/795]
```

Execute it:
```
$ sudo bash HashedWpaSupplicant.sh

***Generate new wpa_supplicant.conf with hashed password***

Type the SSID of the network you want to connect to and press [ENTER]:

TEST_SSID

Type the PASSWORD of the network you want to connect to and press [ENTER]:

TEST_PASSWORD

Wpa_supplicant.conf successfully generated
```

`Wpa_supplicant.conf` looks like this:
```
$ sudo cat wpa_supplicant.conf

network={
        ssid="TEST_SSID"
        psk=c2161655c6ba444d8df94cbbf4e9c5c4c61fc37702b9c66ed37aee1545a5a333
}
```
