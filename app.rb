dep 'apps' do
  requires 'homebrew'
  requires 'homebrew-cask'
  requires 'alfred.cask'
  requires 'steam.cask'
  requires 'sequel-pro.cask'
  requires 'robomongo.cask'
  requires 'google-chrome.cask'
  requires 'adobe-creative-cloud.cask'
  requires 'vlc.cask'
  requires 'dash.cask'
  requires 'dashlane.cask'
  requires 'origin.cask'
  requires 'slate.cask'
end

dep 'brew-cask', :template => 'managed' do
  requires 'homebrew tap'.with('phinze/cask')
  installs 'brew-cask'
end

# Installs Homebrew Cask
dep 'homebrew-cask', :for => :osx, :template => 'lib' do
  requires 'homebrew tap'.with('phinze/cask')
  installs 'brew-cask'
end

# Ensures a particular Homebrew tap has been "tapped"
#
# Homebrew "taps" are like a repository of formulae (instructions used
# by Homebrew to install software). This dep ensures a particular tap
# has been added to Homebrew.
dep 'homebrew tap', :tap_name, :for => :osx do
  requires 'homebrew'

  # Retrieves a list of all existing (tapped) taps
  #
  # This function returns an array, where each element is a string
  # containing the name of a tap that is currently tapped.
  def taps
    shell!('brew tap').strip.lines.map(&:strip)
  end

  met? { taps.include? tap_name.to_s }
  meet {
    log_block "Tapping Homebrew tap '#{tap_name}'" do
      shell! 'brew', 'tap', tap_name.to_s
    end
  }
end

dep 'alfred.cask', :for => :osx
dep 'sequel-pro.cask', :for => :osx do
  meet { `brew cask install sequel-pro` }
end
dep 'robomongo.cask', :for => :osx do
  meet { `brew cask install robomongo` }
end
dep 'google-chrome.cask', :for => :osx do
  meet { `brew cask install google-chrome` }
end
dep 'steam.cask', :for => :osx do
  meet { `brew cask install steam` }
end
dep 'dashlane.cask', :for => :osx do
  meet { `brew cask install dashlane` }
end
dep 'dash.cask', :for => :osx do
  meet { `brew cask install dash` }
end
dep 'origin.cask', :for => :osx do
  meet { `brew cask install origin` }
end
dep 'slate.cask', :for => :osx do
  meet { `brew cask install slate` }
end
dep 'vlc.cask', :for => :osx do
  meet { `brew cask install vlc` }
end
dep 'adobe-creative-cloud.cask', :for => :osx do
  meet { `brew cask install adobe-creative-cloud` }
end
