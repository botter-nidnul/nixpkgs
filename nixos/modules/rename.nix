{ lib, ... }:

with lib;

{
  imports = [
    (mkRenamedOptionModule [ "environment" "x11Packages" ] [ "environment" "systemPackages" ])
    (mkRenamedOptionModule [ "environment" "enableBashCompletion" ] [ "programs" "bash" "enableCompletion" ])
    (mkRenamedOptionModule [ "environment" "nix" ] [ "nix" "package" ])
    (mkRenamedOptionModule [ "fonts" "enableFontConfig" ] [ "fonts" "fontconfig" "enable" ])
    (mkRenamedOptionModule [ "fonts" "extraFonts" ] [ "fonts" "fonts" ])

    (mkRenamedOptionModule [ "security" "extraSetuidPrograms" ] [ "security" "setuidPrograms" ])
    (mkRenamedOptionModule [ "networking" "enableWLAN" ] [ "networking" "wireless" "enable" ])
    (mkRenamedOptionModule [ "networking" "enableRT73Firmware" ] [ "networking" "enableRalinkFirmware" ])

    (mkRenamedOptionModule [ "services" "dockerRegistry" "host" ] [ "services" "dockerRegistry" "listenAddress" ])
    (mkRenamedOptionModule [ "services" "mpd" "network" "host" ] [ "services" "mpd" "network" "listenAddress" ])
    (mkRenamedOptionModule [ "services" "neo4j" "host" ] [ "services" "neo4j" "listenAddress" ])

    # Old Grub-related options.
    (mkRenamedOptionModule [ "boot" "initrd" "extraKernelModules" ] [ "boot" "initrd" "kernelModules" ])
    (mkRenamedOptionModule [ "boot" "extraKernelParams" ] [ "boot" "kernelParams" ])

    # smartd
    (mkRenamedOptionModule [ "services" "smartd" "deviceOpts" ] [ "services" "smartd" "defaults" "monitored" ])

    # OpenSSH
    (mkRenamedOptionModule [ "services" "sshd" "ports" ] [ "services" "openssh" "ports" ])
    (mkAliasOptionModule [ "services" "sshd" "enable" ] [ "services" "openssh" "enable" ])
    (mkRenamedOptionModule [ "services" "sshd" "allowSFTP" ] [ "services" "openssh" "allowSFTP" ])
    (mkRenamedOptionModule [ "services" "sshd" "forwardX11" ] [ "services" "openssh" "forwardX11" ])
    (mkRenamedOptionModule [ "services" "sshd" "gatewayPorts" ] [ "services" "openssh" "gatewayPorts" ])
    (mkRenamedOptionModule [ "services" "sshd" "permitRootLogin" ] [ "services" "openssh" "permitRootLogin" ])
    (mkRenamedOptionModule [ "services" "xserver" "startSSHAgent" ] [ "services" "xserver" "startOpenSSHAgent" ])
    (mkRenamedOptionModule [ "services" "xserver" "startOpenSSHAgent" ] [ "programs" "ssh" "startAgent" ])
    (mkAliasOptionModule [ "services" "openssh" "knownHosts" ] [ "programs" "ssh" "knownHosts" ])

    # VirtualBox
    (mkRenamedOptionModule [ "services" "virtualbox" "enable" ] [ "virtualisation" "virtualbox" "guest" "enable" ])
    (mkRenamedOptionModule [ "services" "virtualboxGuest" "enable" ] [ "virtualisation" "virtualbox" "guest" "enable" ])
    (mkRenamedOptionModule [ "programs" "virtualbox" "enable" ] [ "virtualisation" "virtualbox" "host" "enable" ])
    (mkRenamedOptionModule [ "programs" "virtualbox" "addNetworkInterface" ] [ "virtualisation" "virtualbox" "host" "addNetworkInterface" ])
    (mkRenamedOptionModule [ "programs" "virtualbox" "enableHardening" ] [ "virtualisation" "virtualbox" "host" "enableHardening" ])
    (mkRenamedOptionModule [ "services" "virtualboxHost" "enable" ] [ "virtualisation" "virtualbox" "host" "enable" ])
    (mkRenamedOptionModule [ "services" "virtualboxHost" "addNetworkInterface" ] [ "virtualisation" "virtualbox" "host" "addNetworkInterface" ])
    (mkRenamedOptionModule [ "services" "virtualboxHost" "enableHardening" ] [ "virtualisation" "virtualbox" "host" "enableHardening" ])

    # Tarsnap
    (mkRenamedOptionModule [ "services" "tarsnap" "config" ] [ "services" "tarsnap" "archives" ])

    # proxy
    (mkRenamedOptionModule [ "nix" "proxy" ] [ "networking" "proxy" "default" ])

    # KDE
    (mkRenamedOptionModule [ "kde" "extraPackages" ] [ "environment" "systemPackages" ])
    (mkRenamedOptionModule [ "environment" "kdePackages" ] [ "environment" "systemPackages" ])

    # Multiple efi bootloaders now
    (mkRenamedOptionModule [ "boot" "loader" "efi" "efibootmgr" "enable" ] [ "boot" "loader" "efi" "canTouchEfiVariables" ])

    # NixOS environment changes
    # !!! this hardcodes bash, could we detect from config which shell is actually used?
    (mkRenamedOptionModule [ "environment" "promptInit" ] [ "programs" "bash" "promptInit" ])

    (mkRenamedOptionModule [ "services" "xserver" "driSupport" ] [ "hardware" "opengl" "driSupport" ])
    (mkRenamedOptionModule [ "services" "xserver" "driSupport32Bit" ] [ "hardware" "opengl" "driSupport32Bit" ])
    (mkRenamedOptionModule [ "services" "xserver" "s3tcSupport" ] [ "hardware" "opengl" "s3tcSupport" ])
    (mkRenamedOptionModule [ "hardware" "opengl" "videoDrivers" ] [ "services" "xserver" "videoDrivers" ])

    (mkRenamedOptionModule [ "services" "mysql55" ] [ "services" "mysql" ])

    (mkAliasOptionModule [ "environment" "checkConfigurationOptions" ] [ "_module" "check" ])

    # XBMC
    (mkRenamedOptionModule [ "services" "xserver" "windowManager" "xbmc" ] [ "services" "xserver" "desktopManager" "kodi" ])
    (mkRenamedOptionModule [ "services" "xserver" "desktopManager" "xbmc" ] [ "services" "xserver" "desktopManager" "kodi" ])

    # DNSCrypt-proxy
    (mkRenamedOptionModule [ "services" "dnscrypt-proxy" "port" ] [ "services" "dnscrypt-proxy" "localPort" ])

    # Options that are obsolete and have no replacement.
    (mkRemovedOptionModule [ "boot" "initrd" "luks" "enable" ])
    (mkRemovedOptionModule [ "programs" "bash" "enable" ])
    (mkRemovedOptionModule [ "services" "samba" "defaultShare" ])
    (mkRemovedOptionModule [ "services" "syslog-ng" "serviceName" ])
    (mkRemovedOptionModule [ "services" "syslog-ng" "listenToJournal" ])
    (mkRemovedOptionModule [ "ec2" "metadata" ])
    (mkRemovedOptionModule [ "services" "openvpn" "enable" ])

  ];
}
