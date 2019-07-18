#!/sbin/sh

radio=`getprop ro.boot.radio`

remove_nfc() {
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
}

if [ "$radio" != "APAC" ]  || [ "$radio" != "EMEA" ]; then
    # APAC and EMEA radios have NFC
    remove_nfc
fi

if [ "$radio" != "Brazil" ]  || [ "$radio" != "LATAM" ]; then
    # Brazil and LATAM radios have compasses
    rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
fi
