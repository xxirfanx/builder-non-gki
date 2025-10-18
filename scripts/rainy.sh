echo "Do additional patches"
curl -LSs "https://github.com/kernel-build-from-rainyland/builder-non-gki/raw/main/scripts/sps.sh" | bash
echo "Remove KPM"
scripts/config --enable LTO_CLANG
scripts/config --disable LTO_NONE
scripts/config --disable KPM
echo "Rename Official Local Version String to MoonWakeX"
sed -i 's/-MoonWake-\([0-9.]\+\)/-MoonWakeX-\1/' localversion-moon
