{ config, pkgs, ... }:

{
  home.username = "arman";
  home.homeDirectory = "/home/arman";

  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;

  home.packages = [
    pkgs.yt-dlp
    pkgs.ffmpeg_5
    pkgs.fnm
    pkgs.unrar
    pkgs.unzip
    pkgs.sublime3
    # pkgs.rustup
    # pkgs.lld
    # pkgs.clang
    # pkgs.pkg-config
    # pkgs.openssl
    # pkgs.cmake
    (pkgs.nerdfonts.override { fonts = [ "Agave" ]; })
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    # pkgs.git
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  # "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  fonts.fontconfig.enable = true;

  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "Afif Arman";
      userEmail = "afifarman50@gmail.com";
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    #firefox = {
    #  enable = true;
    #};
    #brave = {
    #  enable = true;
    #};
    go = {
      enable = true;
      goPath = "go";
    };
    bash = {
      enable = true;
      profileExtra = ''
        . "$HOME/.backup_bash_profile/.backup_profile"
      '';
      initExtra = ''
        . "$HOME/.backup_bash_profile/.backup_bashrc"
      '';
    };
  };
}
