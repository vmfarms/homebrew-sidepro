class Sidepro < Formula
    desc "The SidePro CLI"
    homepage "https://sidepro.cloud"
    url "/channels//sidepro-darwin-x64.tar.gz"
    sha256 "598a7e38f2e9405206130502a722703eeeaaddca5c291d5a34aa1e3168e2b1cc"
    version "0.4.13"
    version_scheme 1
    
    depends_on "epinio"
  
    on_macos do
      on_intel do
        url "/channels//sidepro-darwin-x64.tar.gz"
        sha256 "598a7e38f2e9405206130502a722703eeeaaddca5c291d5a34aa1e3168e2b1cc"
      end
      on_arm do
        url "__CLI_MAC_ARM_DOWNLOAD_URL__"
        sha256 "__CLI_MAC_ARM_SHA256__"
      end
    end
  
    on_linux do
      on_intel do
        url "__CLI_LINUX_INTEL_DOWNLOAD_URL__"
        sha256 "__CLI_LINUX_INTEL_SHA256__"
      end
      on_arm do
        url "__CLI_LINUX_ARM_DOWNLOAD_URL__"
        sha256 "__CLI_LINUX_ARM_SHA256__"
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
  