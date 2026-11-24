cask "solvane" do
  version "3.4.4-fork.2"
  sha256 "8c7e371b409a2024a1fef170c54b82a77271cd0291a8ef5ed387b81bfb64155d"

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
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Solvane.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.itzmail.solvane",
    "~/Library/Preferences/com.itzmail.solvane.plist",
  ]
end
