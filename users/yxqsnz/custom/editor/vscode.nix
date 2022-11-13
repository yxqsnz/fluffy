{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [ sumneko.lua llvm-vs-code-extensions.vscode-clangd ];
  };
}
