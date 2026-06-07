{ config, pkgs, ... }:
{
    programs.wofi = {
        enable = true;
        style = ''
            window {
                background-color: rgba(26, 27, 38, 0.9);
                border-radius: 10px;
                border: 1px solid #414868;
            }

            #input {
                background-color: #1a1b26;
                color: #c0caf5;
                border: none;
                border-radius: 5px;
                padding: 8px;
                margin: 8px;
            }

            #outer-box {
                padding: 8px;
            }

            #entry {
                padding: 6px;
                border-radius: 5px;
                color: #c0caf5;
            }

            #entry:selected {
                background-color: #364a82;
                color: #7aa2f7;
            }
        '';
    };
}
