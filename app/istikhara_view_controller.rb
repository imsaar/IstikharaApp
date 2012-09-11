class IstikharaViewController < UIViewController
  def loadView
    #self.view = IstikharaView.alloc.init
  end

  def viewDidLoad
    filePath = NSBundle.mainBundle.pathForResource("quran-uthmani", ofType:"txt")
    contents = File.open(filePath).readlines

    alert = UIAlertView.new
    message = contents[rand(6200)]
    alert.message = message
    alert.addButtonWithTitle("OK")
    #alert.message = NSFileManager.defaultManager.fileExistsAtPath(filePath).to_s
    alert.show
  end
end
