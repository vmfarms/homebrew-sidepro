class Sidepro < Formula
    desc "The SidePro CLI"
    homepage "https://sidepro.cloud"
    url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
    sha256 "36e8cf1e898c721e3f433bf6981a314e3d198a53b67c9c9c843be8e2d81ee7f1"
    version "1.12.0"
    version_scheme 1
  
    on_macos do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
        sha256 "36e8cf1e898c721e3f433bf6981a314e3d198a53b67c9c9c843be8e2d81ee7f1"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-arm64.tar.gz"
        sha256 "170c9b9e0b9eaa1fffe5a2e80fc1eec1669ac476bc914b1531438b645fdb402e"
      end
    end
  
    on_linux do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-x64.tar.gz"
        sha256 "a2ef4e6c17d60ee4b35911a4833b5609acc1c171a550a450975298175e2b73d3"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-arm64.tar.gz"
        sha256 "c1676b662095dad51664dc2658dd4419f077383d9c55905fe196902e076a1ad6"
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
  