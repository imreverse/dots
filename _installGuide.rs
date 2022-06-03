OS: EndeavourOS
Desktop Environment: KDE

Test webcam using mpv (PS change videoX to any number)
mpv av://v4l2:/dev/video2 --profile=low-latency --untimed

0. INDEX
1. Pacman Config, Change Mirrorlist, Do a Full Upgrade
2. Mount and Symlink
3. Download Apps
4. Application Configs
5. Configure Satan's bits precompilation
6. More TODO

// 1. Pacman Config, Change Mirrorlist, Do a Full Upgrade
{
    // Uncomment following in pacman.conf
    Color
    CheckSpace
    VerbosePkgLists
    ParallelDownloads=5

    // Update Mirrors
    reflector --verbose -c AU -c DK -c DE -c IN -c IT -c NL -c NZ -c ES -c CH -c GB -c US --protocol https --sort rate --latest 25 --download-timeout 5

    // Upgrade
    sudo pacman -Syyu

    // Create a package list for future references
}

// 2. Mount and Symlink
{
    # Permanent Mount 250GB EXT4 DATA Partition:
    {
        // Not needed as auto mounting works (Read KDE Settings section)
        $ mkdir /run/media/$USER/data
        $ mount /dev/sda9 /run/media/$USER/data
        $ sudo -e /etc/fstab
        // Add the following line into fstab
        UUID="Check from blkid"    /run/media/$USER/data  ext4  defaults,noatime  0 0

        // fstab should look like this
        {
            # /etc/fstab: static file system information.
            #
            # Use 'blkid' to print the universally unique identifier for a device; this may
            # be used with UUID= as a more robust way to name devices that works even if
            # disks are added and removed. See fstab(5).
            #
            # <file system>                           <mount point>             <type> <options>                                             <dump> <pass>
            UUID=8669-4064                            /boot/efi                 vfat   umask=0077                                              0      2
            UUID=4b7555d2-9d81-47ee-b823-02f090fec8c0 /                         ext4   defaults,noatime                                        0      1
            UUID=151492e4-e87c-469c-9024-2487ef57d0f1 /home                     ext4   defaults,noatime                                        0      2
            UUID=f8f37823-367f-4848-acd6-30c62f135895 /run/media/r3verse/data   ext4   defaults,noatime                                        0      0
            UUID=44AE8AA6AE8A905A                     /run/media/r3verse/win10  ntfs   rw,auto,users,exec,nls=utf8,umask=003,gid=46,uid=1000   0      0
            UUID=01D5DF76FA4D42C0                     /run/media/r3verse/pdisk  ntfs   rw,auto,users,exec,nls=utf8,umask=003,gid=46,uid=1000   0      0
            UUID=26be9963-122c-4f14-8228-40c633a977da /run/media/r3verse/mroot  ext4   defaults,noatime                                        0      0
            UUID=895a440f-9dce-4d7f-a1cb-6104074bf032 /run/media/r3verse/mhome  ext4   defaults,noatime                                        0      0
        }

        chmod 777 [the 250GB EXT4 Partition|/run/media/$USER/data]
    }
    # Create Symlinks
    {
        rm ~/{Documents,Downloads,Music,Pictures,Videos} -r
        ln -s /run/media/$USER/data/Documents ~/Documents
        ...
        ln -s /run/media/$USER/data/Videos ~/Videos
        > Downloads, Documents, Music, Pictures, Videos, .renpy
    }
}

// 3. Download Apps
{
    yay(not_necessary_for_eos)
    {
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        sudo pacman -Rns go
        rm ~/yay -r
    }

    pacman()
    {
        bat
        bash-language-server
        bluez bluez-utils
        btop
        ccls
        chromium
        clamav
        clamtk
        discord
        dolphin-plugins
        entr // TODO: use this for keepassXC online sync
        exa
        ffmpegthumbs
        flameshot
        gimp
        grub
        grub-customizer
        imagemagick
        inter-font
        jdk-openjdk
        kcharselect
        kdialog
        keepassxc
        kio-gdrive
        kitty
        kolourpaint
        ksysguard (for netspeed widget)
        kvantum-qt5
        libreoffice-fresh
        lm_sensors
        lua-language-server
        mediainfo-gui
        mkvtoolnix-gui
        mpv
        neovim
        plasma-wayland-session
        qbittorrent
        qt5-imageformats
        rclone
        ripgrep
        simplescreenrecorder
        speedcrunch
        stow
        tmux
        unrar
        vlc
        vnote
        xcftools
        xclip/wl-clipboard
        yt-dlp
        zsh
    }

    AUR()
    {
        brave-bin
        etcher-bin
        kde-servicemenus-setaswallpaper
        plasma5-applets-eventcalendar
        plasma5-applets-netspeed
        plasma5-applets-virtual-desktop-bar-git
        soundwire
        ventoy-bin
        webcamoid
        xdman
    }

    fonts()
    {
        inter-font
        nerd-fonts-complete
        noto-fonts-emoji
        ttf-alte-haas-grotesk
        ttf-mac-fonts
        ttf-ms-win10-auto
    }
}

// 4. Application Configs
{
    # brave-bin:
        rely kind draw bacon frown nation gadget neglect tooth lend upper absorb code sun display weapon oak taxi deputy verify cost ice quality spice

    # dolphin:
        check preview for videos

    # flameshot: [dots]
        Import keybinds for KDE, under custom shortcuts from .config/flameshot/flameshot-keybinds.khotkeys

    # grub:
    {
        // Grub customization
        git clone https://github.com/imreverse/halo-terminal
        cd halo-terminal
        make
        sudo make install

        // Detect other operating systems
        Add/Uncomment in /etc/default/grub
            GRUB_DISABLE_OS_PROBER=false
        sudo grub-mkconfig
    }

    # gwenview: [dots]*
        did not store because of issues, refresh dots after fresh

    # keepassxc:
    {
        Search for DB and master key.
        Setup rclone (read manpage or website) (dots actually exist, but because of auth token, cant share publicly)
        rclone sync ~/Documents/DB/ r3Mote:_keepassxc/
    }

    # ksysguard: [dots]*
        download the most downloaded tab and delete from .local/share/ksysguard multi2

    # mpv: [dots]

    # neovim: [dots]

    # pacman: [dots]
        // Check first point of this guide.

    # speedcrunch: [dots]

    # zsh: [dots]
        chsh -s $(which zsh) // use zsh instead of bash

    ==============================================
    # bluetooth:
    {
        sudo systemctl enable --now bluetooth.service
        sudo -e /etc/bluetooth/main.conf
            ===
            [General]
            Enable=Source,Sink,Media,Socket
            ===
        sudo systemctl start bluetooth.service
    }

    # libreoffice:
        customize display style

    # new sys monitor ? // TODO

    ==============================================
    # WIDGETS:

    # dolphin:
    {
        > Set As Desktop Wallpaper Context Menu (Will be available by def from 5.24)
          mkdir -p ~/.local/share/kservices5/ServiceMenus/
          cd ~/.local/share/kservices5/ServiceMenus/
          wget https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTY5NzAwNzciLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImM1N2U5NjMyZWEzZDIwZDliZTc5YjRjMjBjMmE3MjczOWFhYjM0MjkxNGEwYmJmYjI0ZDgwZWFiMWYwYThhMzA5MGU4ZjgxYWRkM2M3Y2UxZDg3ZjU0YWFlOGI3ODc5OWM3ZjQxMTM1OTc1ZjE1NDg5NmZiY2Q1OWU2ZDQ3NjIxIiwidCI6MTYyODQ3MzI1Niwic3RmcCI6ImY0MzkyZjgwNThlODNkMDI1ZjhjZTAxZTY3NjE4MjVjIiwic3RpcCI6IjE1MC4yNDIuNzUuMTYwIn0.9K-Ui9A_zb8GJQWwjo7mJQqlM3Z-bRDG8m6Rj9SLnEU/setAsWallpaper.desktop

        > ReImage Context Menu
          https://store.kde.org/p/1231579
    }

    // TODO
    # panels (config for these widgets?):
    {
        > USwitcher [KDE Store]
        > Event Calendar [KDE Store or AUR(plasma5-applets-eventcalendar)]
        > Netspeed Widget [KDE Store or AUR (plasma5-applets-netspeed)]
        > Virtual Desktop Bar [AUR (plasma5-applets-virtual-desktop-bar-git)]
    }

    ==============================================
    # MANUAL SETTINGS:

    # Desktop context menu (Mouse actions right button):
        Config Desktop | Other Actions | Lock, Leave | Wallpaper Actions

    # KDE Settings
    {
        Appearance =
        {
            Global Theme
                Breeze Dark
            Application Style
                Breeze(Can Edit Transparency)/Kvantum(Win10XOS-dark); GTKTheme: Windows-8.1-1.0
            Plasma Style
                Materia/Future-dark
            Colors
                MateriaDark/We10XOSDark
            Windows Decorations
                MateriaDark/We10XOS-dark; Titlebar: Rearrange
            Fonts
                Inter, JetbrainsMono Nerd
            Icons
                Papirus-Dark/Fluent/MkOS-Big-Sur
            Cursors
                Uos/WhiteSur/MaterialDark
            Launch Feedback
                No Feedback, Disable Animation
            Splash None
        }
        Workspace Behavior =
        {
            General Behavior
                Clicking Files Selects them
            Desktop Effects
            {
                Wobbly Windows
                Magic Lamp [ 400 ms ]
                Overview
                Glide
                [
                    Duration: 400 ms
                    Angle: 10, Dis: 100
                ]
            }
            Screen Edges
                MinimizeAll
            Screen Locking
            Virtual Desktops
            {
                Add 2 columns
                Navigation Does not wrap around
            }
        }
        Window Management =
        {
            Window Behavior (Advanced)
                Window Placement: Centered
            Task Switcher
                Large Icons
            KWin Scripts
                MinimizeAll
        }
        Shortcuts = // TODO Export this
        {
            Konsole =
                Meta+Return
            KRunner =
                Meta+Space
            Spectacle [Unbind all]
            Keyboard Layout [Unbind all]
            Kwin =
            {
                Close window: Meta+Q
                Maximize Win: Meta+K
                Minimize Win: Meta+J
                Minimize All: Meta+D
                Quick Tile L: Meta+H
                Quick Tile R: Meta:L
                Show Desktop: Unbind
                Switch DeskR: Meta+Tab
                Switch DeskL: Meta+Shift+Tab
                Switch DeskD: Unbind
                Switch DeskU: Unbind
                Track Mouse : Meta+/
            }
            Session Management =
                Lock Session: Meta+;
            CUSTOM
                Flameshot (goto flameshot config)
        }
        Startup and Shutdown =
        {
            Login Screen > Apply Plasma Settings
            Background Services > Disable Plasma Browser Integration
            Desktop Session > Start empty
        }
        Search (Krunner) [dots]
        Notifications =
            Show low priority in history
        Input Devices (Touchpad) =
            Tap to click, Invert scrolling
        Display =
            Night Color 3500K
        Power Management =
        {
            On AC Power
            [
                Screen brightness no restriction
                Dim 15 min
                Switch off 30 min
                No Suspend
            ]
            On Battery
            [
                Screen brightness no restriction
                Dim 2 min
                Switch off 5 min
                Suspend (Sleep) 10 min
            ]
            On Low Battery
            [
                Screen brightness ultra low
                Dim 1 min
                Switch off 2 min
                Suspend (Sleep) 2 min
            ]
        }
        Removable Storage =
            Enable automatic mounting
    }
}

// 5. Configure Satan's bits precompilation
{
    touch test.cpp
    nvim test.cpp // Add basic c++ code
    g++ -std=c++20 -o test test.cpp -H
    rm -r ~/satan/bits/* -y
    mkdir ~/satan/bits
    cp /usr/include/c++/10.2.0/x86_64-pc-linux-gnu/bits/stdc++.h ~/satan/bits
    cd ~/satan/bits
    g++ -std=c++20 stdc++.h -fsanitize=address,undefined -Wshadow -Wall -Wfatal-errors
}

// 6. More TODO: Read the following links to retrieve useful information and add to this guide
{
    https://www.reddit.com/r/EndeavourOS/comments/rbdlhw/atlantis_edition_average_users_to_do_list_after/
    https://www.reddit.com/r/EndeavourOS/comments/qrs9oj/average_users_to_do_list_after_doing_a_fresh/
}


// * Gnome specific
{
    gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'
    install extensions
    customize keyboard shortcuts
}
