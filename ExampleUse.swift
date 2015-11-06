// This code would be implemented within controller that will do check and display

var RemoteMessage = RemoteMessage()

if RemoteMessage.IsReady {
  RemoteMessage.AttemptToLoadRemoteImage()
  if RemoteMessage.IsMessageAvailable {
    performSegueWithIdentifier("ShowMessage", sender: nil)
  }
}
