mkdir dtbo_maker
cp -a out/arch/arm64/boot/dts/vendor/qcom/. ./dtbo_maker/
python3 scripts/mkdtboimg.py create dtbo_maker/dtbo.img --page_size=4096 $dts_dir/*.dtbo
cp ./dtbo_maker/dtbo.img out/arch/arm64/boot/dtbo.img
rm -rf dtbo_maker