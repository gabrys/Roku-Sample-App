function GetVideos(url)
  result = []

  raw = GetStringFromURL(url)
  json = SimpleJSONParser(raw)

  if json = invalid then
    return false
  end if

  for each video in json.videos
    newVid = {
      id:                      ValidStr(video.id)
      contentId:               ValidStr(video.id)
      shortDescriptionLine1:   ValidStr(video.name)
      title:                   ValidStr(video.name)
      sdPosterURL:             ValidStr(video.videostillurl)
      hdPosterURL:             ValidStr(video.videostillurl)
      streams:                 [
           {
               url : ValidStr(video.videourl)
               bitrate : 100
               quality : false
               contentid : video.id
           }
      ]
      streamFormat:            "mp4"
      contentType:             "episode"
      aacategories:              []
    }

    result.Push(newVid)
  next

  return result
end function
