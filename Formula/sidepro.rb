class Sidepro < Formula
    desc "The SidePro CLI"
    homepage "https://sidepro.cloud"
    url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
    sha256 "59edebd9c3868c0908fcff242ef308128d780b81569d87bdb1dbb953adba4a5b"
    version "1.13.0"
    version_scheme 1
  
    on_macos do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-x64.tar.gz"
        sha256 "59edebd9c3868c0908fcff242ef308128d780b81569d87bdb1dbb953adba4a5b"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-darwin-arm64.tar.gz"
        sha256 "52d85ddf54e5d5a39ea4fc7de8c64916351245d51284cb49701607a47247f9a8"
      end
    end
  
    on_linux do
      on_intel do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-x64.tar.gz"
        sha256 "a4d032ebbb9ca91482242414f5c9a3ed8d8747547f2146c5a258b9960a20d69a"
      end
      on_arm do
        url "https://shared-clients-api.minio.beta.stack.io/sidepro-cli/channels/beta/sidepro-linux-arm64.tar.gz"
        sha256 "a487e1e08e4bc9ff108de7c0c63a76348d02a60ff7dc991d3fda09d1f0aa2871"
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
  