cask "whisperm8" do
  version "2.12.0"
  sha256 "4b5e5bb4f9e4ea73e1add33e3b56c6e61970043e72c066752d05fe3c81b7d146"

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
