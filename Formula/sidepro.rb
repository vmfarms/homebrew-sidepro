class Sidepro < Formula
    desc "The SidePro CLI"
    homepage "https://sidepro.cloud"
    url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
    sha256 "5a45f906384df0fff207d640cc734891f4fc69813e4ea83f6b45989c33ff05aa"
    version "1.12.2"
    version_scheme 1
  
    on_macos do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
        sha256 "5a45f906384df0fff207d640cc734891f4fc69813e4ea83f6b45989c33ff05aa"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-arm64.tar.gz"
        sha256 "05e11c24fa1b1ffde0296d39cc15499c08302f0fb26c8b1249d670c89e3e6b8c"
      end
    end
  
    on_linux do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-x64.tar.gz"
        sha256 "636b437e1c7f5ed6195c781e2df3b5b39af504f96030e06b5ba6f6a9b703a8b8"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-arm64.tar.gz"
        sha256 "813090c75b9da268b33344a1702a5a85301a0fd8a341641e9f55cca6e744e646"
      end
    end
  
    def install
      inreplace "bin/sidepro", /^CLIENT_HOME=/, "export SIDEPRO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
      libexec.install Dir["*"]
      bin.install_symlink libexec/"bin/sidepro"
  
      # bash_completion.install libexec/"autocomplete-scripts/brew/bash" => "sidepro"
      # zsh_completion.install libexec/"autocomplete-scripts/brew/zsh/_sidepro"
    end
  
    def caveats; <<~EOS
      To use the SidePro CLI's autocomplete --
        Via homebrew's shell completion:
          1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
              NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                    and called, either explicitly or via a framework like oh-my-zsh.
          2) Then run
            $ sidepro autocomplete --refresh-cache
        OR
        Use our standalone setup:
          1) Run and follow the install steps:
            $ sidepro autocomplete
    EOS
    end
  
    test do
      system bin/"sidepro", "--version"
    end
  end
  