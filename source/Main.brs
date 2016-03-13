''
'' The starting point.  Shows the poster screen, gets playlist data,
'' and then shows the home screen.
''

sub Main()
  ' first initialize any theme settings
  bcConfig = Config()
  initTheme()

  ' set the simple loading screen
  screenFacade = CreateObject("roPosterScreen")
  screenFacade.showMessage("Loading...")
  screenFacade.show()

  ' show the title
  screenFacade.SetBreadcrumbText(bcConfig.appName, "")

  ' show Playlist screen
  PlaylistScreen(bcConfig.appName, bcConfig.videoListURL)
  screenFacade.showMessage("")
  sleep(25)
end sub
