cask "solvane" do
  version "3.4.4-fork.3"
  sha256 "d3e89734abcb819543f32e5d17883324c09cccd64b4eec57ae67bb2cc02670e5"

  url "https://github.com/itzmail/vorssaint-utils/releases/download/#{version}/Solvane-#{version.split("-").first}.dmg"
  name "Solvane"
  desc "Menu bar utilities for macOS (unofficial fork of Vorssaint)"
  homepage "https://github.com/itzmail/vorssaint-utils"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Solvane.app"

  # Builds are self-signed and not notarized; clear the quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Solvane.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.itzmail.solvane",
    "~/Library/Preferences/com.itzmail.solvane.plist",
    "~/Library/Caches/com.itzmail.solvane",
    "~/Library/HTTPStorages/com.itzmail.solvane",
  ]
end
