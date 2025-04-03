class RdsIamConnect < Formula
    desc "CLI tool for securely connecting to AWS RDS clusters using IAM authentication"
    homepage "https://github.com/ngelik/rds-iam-connect"
    version "0.1.0" # Replace with your actual version
  
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ngelik/rds-iam-connect/releases/download/v0.1.0/rds-iam-connect-darwin-arm64"
        sha256 "sha256sum" # Replace with actual SHA256 sum of the ARM64 binary
      else
        url "https://github.com/ngelik/rds-iam-connect/releases/download/v0.1.0/rds-iam-connect-darwin-amd64"
        sha256 "sha256sum" # Replace with actual SHA256 sum of the AMD64 binary
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        url "https://github.com/ngelik/rds-iam-connect/releases/download/v0.1.0/rds-iam-connect-linux-arm64"
        sha256 "sha256sum" # Replace with actual SHA256 sum of the Linux ARM64 binary
      else
        url "https://github.com/ngelik/rds-iam-connect/releases/download/v0.1.0/rds-iam-connect-linux-amd64"
        sha256 "sha256sum" # Replace with actual SHA256 sum of the Linux AMD64 binary
      end
    end
  
    depends_on "go" => :build
  
    def install
      bin.install "rds-iam-connect-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}" => "rds-iam-connect"
    end
  
    def caveats
      <<~EOS
        Before using rds-iam-connect, make sure you have:
        1. AWS CLI configured with appropriate credentials
        2. Necessary IAM permissions for RDS access
        3. Created a configuration file at ~/.rds-iam-connect/config.yaml
  
        Example configuration can be found at:
        https://github.com/ngelik/rds-iam-connect#configuration
      EOS
    end
  
    test do
      assert_match "rds-iam-connect version #{version}", shell_output("#{bin}/rds-iam-connect --version", 2)
    end
  end
  