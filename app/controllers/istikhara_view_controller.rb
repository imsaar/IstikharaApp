class IstikharaViewController < UIViewController
  def loadView
    self.view = UIView.alloc.init
    filePath = NSBundle.mainBundle.pathForResource("quran-uthmani", ofType:"txt")
    @contents = File.open(filePath) { |file| file.readlines }
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    alert = UIAlertView.new
    message = @contents[rand(6200)]
    alert.message = message
    alert.addButtonWithTitle("OK")
    alert.show

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = message
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label

  end

end
