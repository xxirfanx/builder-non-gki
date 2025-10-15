echo "Do additional patches"
curl -LSs "https://github.com/kernel-build-from-rainyland/builder-non-gki/raw/main/scripts/sps.sh" | bash
echo "Remove KPM"
cat > ./arch/arm64/configs/vendor/kpm.config <<'EOF'
CONFIG_KPM=n
EOF
make ARCH=arm64 O=$OUT_DIR vendor/kpm.config
echo "Remove Official Local Version String"
rm "localversion-moon"
echo "Add experimental version string"
echo "-MoonWake-CI" > localversion-00-experimental
echo "Add commit version string"
echo "-$(git rev-parse --short=7 HEAD)" > localversion-01-experimental
echo "Add run number string"
echo "-$RUN_NUMBER" > localversion-02-experimental
make O=out kernelrelease
echo "Done!"
