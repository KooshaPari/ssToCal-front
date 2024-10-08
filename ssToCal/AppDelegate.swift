//
//  AppDelegate.swift
//  ssToCal
//
//  Created by Koosha Paridehpour on 10/7/24.
//

func applicationDidFinishLaunching(_ notification: Notification) {
  // Register for GetURL events.
  let appleEventManager = NSAppleEventManager.shared()
  appleEventManager.setEventHandler(
    self,
    andSelector: "handleGetURLEvent:replyEvent:",
    forEventClass: AEEventClass(kInternetEventClass),
    andEventID: AEEventID(kAEGetURL)
  )
}
func handleGetURLEvent(event: NSAppleEventDescriptor?, replyEvent: NSAppleEventDescriptor?) {
    if let urlString =
      event?.paramDescriptor(forKeyword: AEKeyword(keyDirectObject))?.stringValue{
        let url = NSURL(string: urlString)
        GIDSignIn.sharedInstance.handle(url)
    }
}
