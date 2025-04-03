class RdsIamConnect < Formula
    desc "CLI tool for securely connecting to AWS RDS clusters using IAM authentication"
    homepage "https://github.com/ngelik/rds-iam-connect"
    version "0.1.5"
  
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ngelik/rds-iam-connect/releases/download/v0.1.5/rds-iam-connect-darwin-arm64"
        sha256 "669bc390dac7755e162593899fd79e896ea6b88be45a5163eaedbb219cb3125d"
      end
    end
  
    depends_on "go" => :build
  
    def install
      bin.install "rds-iam-connect-darwin-arm64" => "rds-iam-connect"
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
