echo "Do additional patches"
curl -LSs "https://github.com/kernel-build-from-rainyland/builder-non-gki/raw/main/scripts/sps.sh" | bash
echo "Remove KPM"
cat > ./arch/arm64/configs/vendor/kpm.config <<'EOF'
CONFIG_KPM=n
CONFIG_LTO_CLANG=y
CONFIG_LTO_=y
EOF
make ARCH=arm64 O=$OUT_DIR vendor/kpm.config
echo "Rename Official Local Version String to MoonWakeX"
sed -i 's/-MoonWake-\([0-9.]\+\)/-MoonWakeX-\1/' localversion-moon
