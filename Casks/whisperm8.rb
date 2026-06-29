cask "whisperm8" do
  version "2.2.0"
  sha256 "5c9c28bb19c96fbe0e5d85d12240c8094b1eda0290d0ba54e9f80c911167407f"

  url "https://github.com/RankM8/WhisperM8/releases/download/v#{version}/WhisperM8-#{version}.dmg"
  name "WhisperM8"
  desc "Hotkey dictation and Claude/Codex agent-chat manager"
  homepage "https://github.com/RankM8/WhisperM8"

  depends_on macos: :sonoma # entspricht .macOS(.v14) in Package.swift; Symbol = ">= Sonoma"

  app "WhisperM8.app"

  # Self-signed/nicht notarisiert: Quarantine selbst entfernen, sonst blockt
  # Gatekeeper den Start. In einem eigenen Tap erlaubt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/WhisperM8.app"]
  end

  zap trash: [
    "~/Library/Application Support/WhisperM8",
    "~/Library/Caches/com.whisperm8.app",
    "~/Library/Preferences/com.whisperm8.app.plist",
  ]
end
