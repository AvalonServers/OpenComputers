basedir="/home/joseph/.local/share/multimc/instances/voodoo_test_descentfrozenhell/.minecraft/saves/OC Test World/opencomputers"
mncdir="$basedir/74d3ed3a-bda4-49c3-b74c-89c0314e2faa"
clientdir="$basedir/e93b183c-6fda-453d-92ac-4c1ef30d80e2"

# copy mnc
cp mnc/lib/GERTeAPI.lua "$mncdir/lib/"
mkdir -p "$mncdir/usr/bin" && cp mnc/usr/bin/GERTiMNC.lua "$mncdir/usr/bin/"
cp mnc/autorun.lua "$mncdir/"
cp mnc/usr/bin/GERTconfig.cfg "$mncdir/usr/bin/"
cp mnc/usr/bin/peers.geds "$mncdir/usr/bin/"

cp lib/* "$clientdir/lib/"
cp -r client "$clientdir/home/"