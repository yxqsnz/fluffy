{ pkgs, config, ... }: {
  home.file.".cargo/config.toml" = {
    text = ''[build]
rustc-wrapper = "${pkgs.sccache}/bin/sccache"
target-dir = "${config.home.homeDirectory}/.cargo/target"
jobs = 8

[profile.dev]
debug = false

[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "link-arg=-fuse-ld=mold", "-C", "link-arg=-Xlinker --threads=8",]
linker = "${pkgs.clang_14}/bin/clang"'';
  };
}

