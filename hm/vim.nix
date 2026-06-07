{ config, pkgs, ... }:
{
    programs.vim = {
        enable = true;
        settings = {
            expandtab = true;
            shiftwidth = 4;
            tabstop = 4;
            number = true;
            relativenumber = true;
        };
        extraConfig = ''
            filetype plugin indent on
            set softtabstop=4
            set smartindent
            set showmatch
            set backspace=indent,eol,start
            syntax on
        '';
    };
}
