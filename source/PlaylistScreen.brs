''
'' Displays the videos in a playlist
''

sub PlaylistScreen(appName, videoListURL)
  screen = CreateObject("roPosterScreen")
  screen.SetMessagePort(CreateObject("roMessagePort"))
  screen.SetListStyle("flat-category")
  screen.SetListDisplayMode("zoom-to-fill")
  screen.SetBreadcrumbText(appName, "")
  screen.Show()

  ' get the playlist content if needed
  content = GetVideos(videoListURL)
  if content = invalid or content.count() = 0
    ShowConnectionFailed()
    return
  end if

  selectedVideo = 0
  screen.SetContentList(content)
  screen.Show()

  while true
    msg = wait(0, screen.GetMessagePort())

    if msg <> invalid
      if msg.isScreenClosed()
        exit while
      else if msg.isListItemFocused()
        selectedVideo = msg.GetIndex()
      else if msg.isListItemSelected()
        showVideoScreen(content[selectedVideo])
      else if msg.isRemoteKeyPressed()
        if msg.GetIndex() = 13
          showVideoScreen(content[selectedVideo])
        end if
      end if
    end if
  end while
end sub
