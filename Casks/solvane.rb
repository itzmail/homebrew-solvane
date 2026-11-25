cask "solvane" do
  version "3.4.4.1"
  sha256 "d5cf651f1f286be1c8d0d3077587573c642da57e12b8dfa570cc16b65f6fcbe9"

  url "https://github.com/itzmail/vorssaint-utils/releases/download/#{version}/Solvane-#{version.major_minor_patch}.dmg"
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
