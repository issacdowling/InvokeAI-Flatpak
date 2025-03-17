wget https://download.invoke.ai/Invoke%20Community%20Edition.AppImage
chmod +x "./Invoke Community Edition.AppImage"
"./Invoke Community Edition.AppImage" --appimage-extract

sed -i 's/exec "$BIN"/exec "$BIN" "--no-sandbox" "--enable-features=UseOzonePlatform" "--ozone-platform=wayland"/g' ./squashfs-root/AppRun

flatpak run org.flatpak.Builder --user --install --force-clean build-dir com.invoke.community.json

echo "Before running the installer, you'll need to allow internet access (as it's disabled by default).\nYou can either do this using Flatseal or by running:\nflatpak override --user --share=network com.invoke.community\nthen running the same thing but with --unshare instead of --share to remove it later."
