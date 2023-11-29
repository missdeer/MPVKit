#!/bin/sh
echo "DO NOT forget to apply MPVkit.patch first"
swift run build enable-openssl enable-libass enable-ffmpeg enable-mpv
if [ ! -d "libmpv" ]; then
	mkdir libmpv
fi
find Sources -name 'Lib*' -type f | grep macos | while read file; do
	cp "$file" libmpv/
done
cd libmpv
for file in Lib*; do
	name=${file#Lib}
	mv "$file" "lib${name}.a"
done
