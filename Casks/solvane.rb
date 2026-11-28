cask "solvane" do
  version "3.4.5.1"
  sha256 "17fb72f8b836c2f7fcd32bbac1bf772add1ebde7f966cdfd1cacefbcdbc8ebb2"

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
