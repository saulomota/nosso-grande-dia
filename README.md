# 💍 Nosso Grande Dia

App pessoal de contagem regressiva para o casamento de **Saulo & Ana Lúcia**,
com data-alvo em **09/09/2026**. Depois do casamento, o app troca
automaticamente para "Casados há X dias".

Feito em **Flutter**, compilado em APK **100% pela nuvem via GitHub Actions**
— não é necessário instalar Android Studio.

---

## ✨ O que a v1 já faz

- Tela principal com tema escuro (preto/azul-marinho) e detalhes dourados.
- Contagem regressiva em Dias / Horas / Minutos / Segundos, atualizada a
  cada segundo.
- Troca automática de "Faltam X dias" para "Casados há X dias" na hora
  certa, sem precisar reinstalar o app.
- Versículo de Mateus 19:6 na tela principal.
- **Widget de tela inicial** (pequeno e grande) mostrando a contagem,
  atualizado automaticamente.
- Projeto organizado (`core/`, `models/`, `services/`, `screens/`,
  `widgets/`) e pronto para novas funcionalidades — veja
  [`docs/PROXIMOS_PASSOS.md`](docs/PROXIMOS_PASSOS.md).

---

## 🗂️ Estrutura do projeto

```
nosso_grande_dia/
├── lib/
│   ├── core/
│   │   ├── constants/app_constants.dart   # nomes, data do casamento, versículo
│   │   └── theme/app_theme.dart           # cores e tema (preto/azul + dourado)
│   ├── models/countdown_data.dart
│   ├── services/
│   │   ├── countdown_service.dart         # calcula dias/horas/min/seg
│   │   └── widget_service.dart            # envia dados pro widget nativo
│   ├── screens/home_screen.dart
│   ├── widgets/                           # componentes visuais reutilizáveis
│   └── main.dart
├── android_overlay/                       # arquivos nativos do widget Android
│   └── app/src/main/{kotlin,res}          # providers Kotlin + layouts + ícone
├── tools/
│   ├── apply_android_overlay.sh           # copia o overlay pra dentro de android/
│   └── patch_manifest.py                  # registra os widgets no Manifest
├── .github/workflows/build_apk.yml        # workflow que gera o APK
├── docs/PROXIMOS_PASSOS.md                # roteiro de futuras funcionalidades
└── pubspec.yaml
```

> **Por que não existe uma pasta `android/` pronta no repositório?**
> Ela é gerada automaticamente pelo próprio workflow (`flutter create`),
> sempre compatível com a versão do Flutter usada no build. Depois disso,
> o script `tools/apply_android_overlay.sh` copia por cima os arquivos do
> widget (em `android_overlay/`). Isso evita problemas de versão do Gradle
> e mantém o repositório limpo. Se quiser rodar localmente, o mesmo
> processo funciona no seu computador (veja mais abaixo).

---

## 🚀 Passo a passo: publicar no GitHub e gerar o APK

### 1. Criar o repositório no GitHub

1. Crie um repositório novo (pode ser privado), por exemplo
   `nosso-grande-dia`.
2. No seu computador, dentro da pasta do projeto:

```bash
git init
git add .
git commit -m "Primeira versão do Nosso Grande Dia"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/nosso-grande-dia.git
git push -u origin main
```

### 2. Deixar o GitHub Actions compilar o APK

Assim que você fizer o `push` para a branch `main`, o workflow em
`.github/workflows/build_apk.yml` roda sozinho e:

1. Instala o Flutter na nuvem.
2. Roda `flutter create --platforms=android .` para gerar a pasta `android/`.
3. Aplica o overlay do widget (`tools/apply_android_overlay.sh`).
4. Compila o **APK de release**.
5. Publica o APK como:
   - **Artifact** do workflow (sempre), e
   - **Release** do repositório (com tag `build-N`), pronta para download
     direto — essa é a forma mais fácil de baixar no celular.

Você também pode disparar manualmente: na aba **Actions** do repositório,
escolha o workflow **"Build APK - Nosso Grande Dia"** → **Run workflow**.

### 3. Baixar o APK

**Opção A — pela aba Releases (mais fácil):**
1. No repositório, clique em **Releases** (barra lateral direita).
2. Abra a release mais recente (`build-N`).
3. Baixe o arquivo `app-release.apk` direto pelo navegador do celular.

**Opção B — pela aba Actions:**
1. Vá em **Actions** → clique na execução mais recente (com ✅ verde).
2. Role até **Artifacts** → baixe `nosso-grande-dia-apk` (vem como `.zip`,
   extraia para chegar no `.apk`).

---

## 📲 Como instalar no celular

1. Baixe o `app-release.apk` (via link do passo acima, direto no celular,
   ou transferido do computador).
2. Toque no arquivo `.apk` baixado.
3. Se aparecer aviso do Android bloqueando a instalação, vá em
   **Configurações → Apps → Acesso especial → Instalar apps desconhecidos**,
   permita para o app que você usou para baixar (Chrome, Arquivos, etc.).
4. Volte e toque em **Instalar**.
5. Abra o app **"Nosso Grande Dia"**.

### Adicionar o widget na tela inicial

1. Toque e segure em um espaço vazio da tela inicial do Android.
2. Toque em **Widgets**.
3. Procure **"Nosso Grande Dia"** na lista.
4. Escolha o widget **pequeno** (💍 Nosso Dia / X dias) ou o **grande**
   (💍 Nosso Grande Dia / Saulo ❤️ Ana / X dias / 09/09/2026) e arraste
   para a tela.
5. O widget atualiza sozinho automaticamente (a cada ~30 min, que é o
   mínimo permitido pelo Android) e também sempre que você abrir o app.

---

## 💻 Rodando/compilando localmente (opcional)

Você não precisa disso para usar o app — é só caso queira testar no seu
computador antes de publicar. Requer o Flutter SDK instalado (não precisa
do Android Studio completo, só as ferramentas de linha de comando +
Android SDK/`cmdline-tools`).

```bash
flutter pub get
flutter create --platforms=android --org com.saulo --project-name nosso_grande_dia .
bash tools/apply_android_overlay.sh
flutter build apk --release
# ou, para testar em um emulador/aparelho conectado:
flutter run
```

O APK final fica em `build/app/outputs/flutter-apk/app-release.apk`.

---

## 🎨 Personalizar

- **Nomes, data, versículo:** edite `lib/core/constants/app_constants.dart`.
- **Cores:** edite `lib/core/theme/app_theme.dart` (`AppColors`).
- **Ícone do app:** os PNGs em `android_overlay/app/src/main/res/mipmap-*/`
  são copiados por cima do ícone padrão do Flutter durante o build. Troque
  esses arquivos pelos seus (mesmo nome `ic_launcher.png`, mesmas pastas
  de densidade) para usar outro ícone.
- **Textos do widget:** edite os layouts em
  `android_overlay/app/src/main/res/layout/widget_small.xml` e
  `widget_large.xml`, e os providers Kotlin em
  `android_overlay/app/src/main/kotlin/com/saulo/nossograndedia/`.

---

## 🧭 Próximas funcionalidades

O projeto já está organizado para receber foto do casal, galeria de
momentos, datas importantes, aniversário de casamento, lista de tarefas,
controle financeiro simples, plano de leitura bíblica, viagens e metas do
casal. Veja o roteiro sugerido em
[`docs/PROXIMOS_PASSOS.md`](docs/PROXIMOS_PASSOS.md).

---

*Feito com carinho para Saulo & Ana Lúcia — "Assim, eles já não são dois,
mas uma só carne." (Mateus 19:6)*
