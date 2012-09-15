class IstikharaViewController < UIViewController
  def loadView
    self.view = UIView.alloc.init
    filePath = NSBundle.mainBundle.pathForResource("quran-uthmani", ofType:"txt")
    @contents = File.open(filePath) { |file| file.readlines }
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    message = randomAyah

    @textView = UITextView.alloc.initWithFrame(CGRectMake(5,40,310,640))
    @textView.text = message
    @textView.font = UIFont.systemFontOfSize(20)
    @textView.textColor = UIColor.blackColor
    @textView.editable = false
    @textView.textAlignment = UITextAlignmentRight

    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle('Next', forState:UIControlStateNormal)
    @button.addTarget(self, action:'nextTapped', forControlEvents:UIControlEventTouchUpInside)
    @button.frame = [[50, 400], [view.frame.size.width - 50 * 2, 40]]

    self.view.addSubview @textView
    self.view.addSubview @button
  end

  def nextTapped
    @textView.text = randomAyah
  end

  def randomAyah
    @contents[rand(6235)]
  end

end
