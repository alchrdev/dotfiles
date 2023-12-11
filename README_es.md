# Alchr's dotfiles

[English version](./README.md)

Hola, soy Alchr. Originalmente creé este repositorio y documentación para mi uso personal. Noté que hay poca información disponible sobre cómo configurar Neovim en Windows sin depender de WSL (Windows Subsystem for Linux), por lo que pensé que sería útil compartir mi enfoque “por defecto”.

Debo aclarar que soy un principiante en el mundo de la programación y actualmente estoy aprendiendo desarrollo web front-end de forma autodidacta. Es posible que mi configuración no sea tan robusta o completa como podría ser, pero confío en que la mejoraré con el tiempo.

No pretendo ser presuntuoso, pero si alguien se encuentra leyendo esto y le resulta útil, me alegrará saberlo.

Además, quiero enfatizar que no me interesa ser parte de debates sobre cuál editor es el “mejor”. Cada persona tiene la libertad de elegir el editor que mejor se adapte a sus necesidades y esa elección debe ser respetada. De hecho, intenté configurar VSCode para que se parezca al flujo de trabajo de Neovim. Si tienes curiosidad, puedes echar un vistazo al siguiente [enlace](https://github.com/alchrdev/vscode_keybindings).

## 🛠️ Configuración de Neovim

### 🪟 Windows

Cuando empecé a programar usaba *Sublime Text* pero luego me pasé a *Visual Studio Code*. Sin embargo, este editor consumía muchos recursos y ralentizaba el portátil, que tiene un hardware limitado (Intel Celeron with 4GB RAM). Entonces, descubrí Neovim y quedé fascinado por su rapidez y versatilidad. Aunque al principio me costó entenderlo, poco a poco fui adaptándome y ahora no quiero dejarlo ir.

- **Estas son algunas de las personas que me han guiado en este camino:**
  - [Josean Martinez](https://www.youtube.com/@joseanmartinez)
  - [ThePrimeagen](https://www.youtube.com/@ThePrimeagen)
  - [Adib Hanna](https://www.youtube.com/@adibhanna)
  - [Sockthedev](https://www.youtube.com/@sockthedev4904), entre otros.

Por lo tanto, mi configuración podría considerarse un *Frankenstein*  de configuraciones, ya que he recopilado lo mejor de cada una hasta crear algo que entiendo a un nivel medio y que se adapta perfectamente a mis necesidades.

#### Descarga e instalación de las herramientas necesarias

- **Ejecutables**
  - [Git](https://git-scm.com/downloads)
  - [Node.js](https://nodejs.org/en)
  - [Visual Studio 2015 C++ redistributable](https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170) `https://aka.ms/vs/17/release/vc_redist.x64.exe`
- **Extraíbles** (Todos estos deben ser añadidos al PATH _Variables de entorno_)
  - [Neovim](https://github.com/neovim/neovim/releases/tag/stable) `nvim-win64.zip`
  - [Ripgrep](https://github.com/BurntSushi/ripgrep/releases/tag/13.0.0) `ripgrep-13.0.0-x86_64-pc-windows-msvc.zip`
  - [Mingw](https://github.com/niXman/mingw-builds-binaries/releases/tag/13.1.0-rt_v11-rev1) `x86_64-13.1.0-release-win32-seh-msvcrt-rt_v11-rev1.7z`
  - [Treesitter](https://github.com/tree-sitter/tree-sitter/releases/tag/v0.20.8) `tree-sitter-windows-x64.gz`

*Puedes elegir el nombre que quieras para tus carpetas, aquí te dejo un ejemplo de cómo lo tengo yo:*

- **En la unidad `C` creé una carpeta `C:\Tools` y dentro de ella las siguientes subcarpetas:**
  - `C:\Tools\mingw\bin`
  - `C:\Tools\nvim\bin`
  - `C:\Tools\ripgrep`
  - `C:\Tools\tree-sitter`

> Al descomprimir `tree-sitter-windows-x64.gz`, encontrarás un archivo `.exe`. Te recomiendo que crees una carpeta llamada `tree-sitter` y que muevas el archivo `.exe` dentro de ella. Así será más fácil añadir el archivo a las variables de entorno en pasos posteriores.

#### ¿Cómo compruebo que se instalaron correctamente?

- **Para ello puedes ejecutar los siguientes comandos:**
  - **neovim:** `nvim --version`
  - **ripgrep:** `rg --version`
  - **mingw:** `gcc --version`
  - **tree-sitter:** `tree-sitter --version`

**P/R:** ¿Por qué no usé un gestor de paquetes como _Scoop_ o _Chocolatey_? Porque prefiero tener más control sobre las herramientas que uso. Recuerda cerrar y reiniciar tu terminal si los cambios no se aplican.

Una vez que hayas hecho esto, puedes ejecutar `nvim` en la terminal. Se creará automáticamente una carpeta llamada `nvim-data` en `C:\Users\tuUsuario\AppData\Local\nvim-data`. En la misma ubicación, tendrás que crear otra llamada `nvim` y poner tu configuración dentro. Puedes crearlas manualmente o clonar una de alguien que te guste o admires con un `git clone https://github.com/nombredeusuario/nvim.lua.git nvim`.


### 🐧 Linux (Ubuntu)

#### Para descargar el AppImage de Neovim desde el repositorio oficial de GitHub, sigue estos pasos:

- Visita [este enlace](https://github.com/neovim/neovim/releases) y busca el archivo `nvim.appimage`.
- Descarga el archivo y muévelo a la carpeta `~/.local/bin`.
- Hazlo ejecutable con el comando `chmod +x nvim.appimage` y crea un enlace simbólico con `ln -s nvim.appimage nvim`.
- Para añadirlo al `PATH`, edita el archivo `.bashrc` con el comando `nano ~/.bashrc` y añade la línea `export PATH=~/.local/bin:$PATH` al final.
- Guarda los cambios y cierra el editor.
- Finalmente, ejecuta el comando `source ~/.bashrc` para aplicar los cambios.


#### Para evitar posibles errores con `appimage` en Ubuntu, puedes instalar `libfuse2` con el siguiente comando:

```bash
sudo apt install libfuse2
```

- También puedes instalar algunas herramientas adicionales como `ripgrep`, `git`, `nodejs`, `xclip`, `build-essential` y `tree-sitter-cli` con los siguientes comandos:

```bash
# Instalar ripgrep
sudo apt install ripgrep

# Instalar git
sudo apt-get install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# Instalar nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Habilitar portapapeles
sudo apt install xclip

# Instalar compilador C
sudo apt-get install build-essential

# Instalar tree-sitter-cli
sudo npm install -g tree-sitter-cli
```
