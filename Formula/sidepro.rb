class Sidepro < Formula
    desc "The SidePro CLI"
    homepage "https://sidepro.cloud"
    url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
    sha256 "37309011f8f11e70610b441afae208116cc47c14909f54e7228a8cf4befbcabe"
    version "0.4.17"
    version_scheme 1
    
    depends_on "epinio"
  
    on_macos do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
        sha256 "37309011f8f11e70610b441afae208116cc47c14909f54e7228a8cf4befbcabe"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-arm64.tar.gz"
        sha256 "773ac0286c67f7d7435e8a91024ee57d4c6261e54e05348fd8a621f8cb1fc39e"
      end
    end
  
    on_linux do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-x64.tar.gz"
        sha256 "f6f7ae5456ac8498b4827612021bd8f4524cba8d570a48773b99230ad537904a"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-arm64.tar.gz"
        sha256 "fe29f01df2af75faa9867269158d236271fa64d8f2fe5a7af5ddbd4c6914b24a"
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
  