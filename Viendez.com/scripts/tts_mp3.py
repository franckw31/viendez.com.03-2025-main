#!/usr/bin/env python3
import argparse
import sys
from pathlib import Path

try:
    from gtts import gTTS
except ImportError:
    print("Le module gTTS n'est pas installé. Installez-le avec: pip install gTTS")
    sys.exit(1)


def main():
    parser = argparse.ArgumentParser(description="Génère un fichier MP3 à partir d'une phrase.")
    parser.add_argument("-t", "--text", help="Texte à convertir en audio. Si omis, le script vous le demandera.")
    parser.add_argument("-o", "--output", default="output.mp3", help="Nom du fichier MP3 de sortie (par défaut: output.mp3)")
    parser.add_argument("-l", "--lang", default="fr", help="Langue du TTS (par défaut: fr)")
    args = parser.parse_args()

    text = args.text
    if not text:
        try:
            text = input("Saisissez la phrase à convertir en MP3: ").strip()
        except KeyboardInterrupt:
            print("\nAnnulé.")
            sys.exit(1)
    if not text:
        print("Aucun texte fourni.")
        sys.exit(1)

    out_path = Path(args.output)
    try:
        tts = gTTS(text=text, lang=args.lang)
        tts.save(str(out_path))
        print(f"Fichier MP3 généré: {out_path.resolve()}")
    except Exception as e:
        print(f"Erreur lors de la synthèse vocale: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
