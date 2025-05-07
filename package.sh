wget https://download.invoke.ai/Invoke%20Community%20Edition.AppImage
chmod +x "./Invoke Community Edition.AppImage"
"./Invoke Community Edition.AppImage" --appimage-extract

# Make it run "without a sandbox" (since we're relying on Flatpak for that)
sed -i 's/exec "$BIN"/exec \/app\/invoke-community-edition "--no-sandbox" "--enable-features=UseOzonePlatform" "--ozone-platform=wayland"/g' ./squashfs-root/AppRun

# Change icon name in .desktop file to match the flatpak app id, make it use patched AppRun instead of putting no-sandbox here
mv ./squashfs-root/invoke-community-edition.desktop ./squashfs-root/com.invoke.community.desktop
# rm ./squashfs-root/invoke-community-edition.png
sed -i 's/Icon=invoke-community-edition/Icon=com.invoke.community/g' ./squashfs-root/com.invoke.community.desktop
sed -i 's/Exec=AppRun --no-sandbox %U/Exec=\/app\/AppRun %U/g' ./squashfs-root/com.invoke.community.desktop

flatpak run org.flatpak.Builder --user --install --force-clean build-dir com.invoke.community.json

echo "Before running the installer, you'll need to allow internet access (as it's disabled by default).\nYou can either do this using Flatseal or by running:\nflatpak override --user --share=network com.invoke.community\nthen running the same thing but with --unshare instead of --share to remove it once installed.\nSet the install directory to ~/.var/app/com.invoke.community/data/install"

# Icon things are very broken and will not export for me, so I'm just manually putting it where it needs to go (the flatpak exports directory doesn't make it happy), which is bad but works
cp ./build-dir/files/usr/share/icons/hicolor/1024x1024/apps/invoke-community-edition.png ~/.local/share/icons/com.invoke.community.png
