''
'' Used to manage account settings and theme
''

Function Config() As Object
  this = {
    ' the name to show on top of screens
    appName: "Test Application"

    ' URL for the JSON playlist
    videoListURL: "https://raw.githubusercontent.com/gabrys/Roku-Sample-App/master/example.json"
  }
  return this

End Function
