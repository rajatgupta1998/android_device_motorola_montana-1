#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`

remove_nfc() {
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
}

if [ "$sku" == "XT1790" ]  || [ "$sku" == "XT1792" ] || [ "$sku" == "XT1795" ]; then
    # XT1790, XT1792 and XT1795 don't have NFC
    remove_nfc
fi

if [ "$sku" != "XT1790" ] || [ "$sku" != "XT1792" ] || [ "$sku" != "XT1795" ]; then
    # XT1790,XT1792 and XT1795 have a compass
    rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
fi
