SOURCE="https://dl3.xmind.net/xmind-8-update8-linux.zip"
DESTINATION="build.zip"
OUTPUT="Xmind8.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -qO $(DESTINATION) -c $(SOURCE)

	rm -rf AppDir/opt
	mkdir -p AppDir/opt/application xmind

	unzip -qq $(DESTINATION) -d xmind

	mv xmind/XMind_amd64/* AppDir/opt/application
	mv xmind/plugins AppDir/opt/application
	mv xmind/features AppDir/opt/application
	mv xmind/fonts  AppDir/opt/application
	cp XMind.ini  AppDir/opt/application

	curl -sLo appimagetool \
    https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage

	chmod +x appimagetool

	ARCH=x86_64 ./appimagetool AppDir $(OUTPUT)
	chmod +x $(OUTPUT)
