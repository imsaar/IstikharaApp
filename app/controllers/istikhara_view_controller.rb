class IstikharaViewController < UIViewController
  def loadView
    #self.view = IstikharaView.alloc.init
    filePath = NSBundle.mainBundle.pathForResource("quran-uthmani", ofType:"txt")
    @contents = File.open(filePath).readlines
  end

  def viewDidLoad
    super

    alert = UIAlertView.new
    message = @contents[rand(6200)]
    alert.message = message
    alert.addButtonWithTitle("OK")
    alert.show

  end
end
