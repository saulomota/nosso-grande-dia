#!/usr/bin/env bash
# Copia os arquivos nativos do widget (android_overlay/) para dentro do
# projeto Android gerado pelo `flutter create` e registra os receivers
# no AndroidManifest.xml.
#
# Uso: bash tools/apply_android_overlay.sh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ ! -d "android" ]; then
  echo "Pasta android/ não encontrada. Rode 'flutter create --platforms=android .' antes."
  exit 1
fi

echo "Copiando arquivos Kotlin do widget..."
mkdir -p android/app/src/main/kotlin/com/saulo/nossograndedia
cp android_overlay/app/src/main/kotlin/com/saulo/nossograndedia/*.kt \
   android/app/src/main/kotlin/com/saulo/nossograndedia/

echo "Copiando layouts, xml e drawables do widget..."
mkdir -p android/app/src/main/res/layout
mkdir -p android/app/src/main/res/xml
mkdir -p android/app/src/main/res/drawable
mkdir -p android/app/src/main/res/values
cp android_overlay/app/src/main/res/layout/*.xml android/app/src/main/res/layout/
cp android_overlay/app/src/main/res/xml/*.xml android/app/src/main/res/xml/
cp android_overlay/app/src/main/res/drawable/*.xml android/app/src/main/res/drawable/
cp android_overlay/app/src/main/res/values/strings.xml android/app/src/main/res/values/widget_strings.xml

echo "Copiando ícone do app (aliança dourada)..."
for dpi in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  mkdir -p "android/app/src/main/res/mipmap-$dpi"
  cp "android_overlay/app/src/main/res/mipmap-$dpi/ic_launcher.png" \
     "android/app/src/main/res/mipmap-$dpi/ic_launcher.png"
done

echo "Registrando os receivers dos widgets no AndroidManifest.xml..."
python3 "$ROOT_DIR/tools/patch_manifest.py"

echo "Overlay do widget aplicado com sucesso."
