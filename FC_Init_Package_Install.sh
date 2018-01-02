# Configuración Inicial PC FC
# Corra bajo su propio riesgo, I assume no liability
echo "Bienvenidos al set-up inicial de PC Fedora de Orlando
"

# Actualizar
echo "Actualizando los paquetes preinstalados de fábrica..."
sudo dnf -y update

# Agregar repositorios rpm fusion (free y nonfree)
echo "Agregar los repositorios RPM fusion (free y non-free)

Introduce la contraseña de root (su)"

su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

# Instalar akmod-wl para wl wifi HP Broadcom
echo "Deseas instalar el driver de WiFi para Laptops HP? y/n"
read wifi_choice

if (( $wifi_choice=="y")); then

    sudo dnf install akmod-wl
    # ---> Ojo instalar luego el kernel-devel buscando en apper???
    sudo dnf install kernel-devel
    akmods --force
    sudo modprobe wl
    iwconfig
    
else

    echo "Decidiste no instalar los drivers para WiFi HP Broadcom"
    
fi

# Instalar Google Chrome Stable desde su repositorio:
su
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
exit #sale de su

sudo dnf install google-chrome

# Instalar paquetes para trabajar con audio y video
sudo dnf install vlc xine kdenlive youtube-dl ffmpeg kde-connect audacity lame gstreamer gstreamer-plugins-ugly

# Instalar paquetes para editar imágenes
sudo dnf install inkscape gimp kphotoalbum

# Instalar bibliotecas científicas de python
sudo dnf install numpy scipy python3-matplotlib python2-matplotlib

# Aplicaciones basicas de documentos, fuentes Droid y mscore;  paquetes de LaTeX
sudo dnf install lyx jabref libreoffice 
sudo dnf install texlive-epstopdf texlive-babel-spanish texlive-esint texlive-matlab-prettifier texlive-esint-type1 texlive-droid texlive-IEEEtran unrar
sudo dnf install cabextract
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Instalar Dropbox (requiere los rpm-fusion)
sudo dnf install dropbox

# Instalar otros
sudo dnf install keepassx git lynx

# Instalar bibliotecas y compiladores para MATLAB
sudo dnf install gcc-gfortran

# Instalar Google Fonts y Adobe Pro Fonts (sans-serif-mono)
sudo dnf install liberation-fonts google-droid-serif-fonts google-droid-sans-fonts google-droid-sans-mono-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts

# Instalar el escritorio Xfce
sudo dnf groupinstall "Xfce Desktop"

# Instalar diff utility
sudo dnf install kompare

# Instalar Sublime
curl -L git.io/sublimetext | sh

# Instalar Driver Impresora HP
sudo dnf install hplip hplip-gui libtool

# Instalar Wine
sudo dnf install wine

# El color de okular claro es FBF0D9 y el oscuro 5B4636
