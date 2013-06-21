class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = IstikharaViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end

  def applicationDidEnterBackground(options)
    @window.rootViewController = nil
  end

  def applicationWillEnterForeground(options)
    @window.rootViewController = IstikharaViewController.alloc.init
  end
end
