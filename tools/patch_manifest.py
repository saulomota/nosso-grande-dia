#!/usr/bin/env python3
"""Insere os receivers dos widgets dentro de <application> no
AndroidManifest.xml gerado pelo `flutter create`, e garante que a
Activity principal tenha o tema/label esperado. Idempotente: se os
receivers já foram inseridos antes, não duplica."""
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "android" / "app" / "src" / "main" / "AndroidManifest.xml"
SNIPPET_FILE = ROOT / "android_overlay" / "manifest_snippet.xml"

MARKER = "Nosso Grande Dia"


def main() -> None:
    manifest_text = MANIFEST.read_text(encoding="utf-8")

    manifest_text = manifest_text.replace(
        'android:label="nosso_grande_dia"',
        'android:label="Nosso Grande Dia"',
    )

    if MARKER in manifest_text:
        print("Receivers já presentes no AndroidManifest.xml — nada a fazer.")
        MANIFEST.write_text(manifest_text, encoding="utf-8")
        return

    snippet = SNIPPET_FILE.read_text(encoding="utf-8")
    # Indenta o snippet para ficar alinhado dentro de <application>.
    indented = "\n".join(
        ("    " + line if line.strip() else line) for line in snippet.splitlines()
    )

    if "</application>" not in manifest_text:
        raise SystemExit("Tag </application> não encontrada no AndroidManifest.xml")

    new_text = manifest_text.replace(
        "</application>", f"{indented}\n    </application>"
    )
    MANIFEST.write_text(new_text, encoding="utf-8")
    print("AndroidManifest.xml atualizado com os receivers dos widgets.")


if __name__ == "__main__":
    main()
