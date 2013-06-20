class IstikharaViewController < UIViewController
  def loadView
    self.view = UIView.alloc.init
    filePath = NSBundle.mainBundle.pathForResource("quran-uthmani", ofType:"txt")
    @contents = File.open(filePath) { |file| file.readlines }
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.colorWithRed(1.0, green:1.0, blue:0.745, alpha:1.0)
    self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed("background"))

    message = randomAyah

    @textView = textView(message)

    button_y = 410
    button_height = 40
    distance_between_buttons = 25

    button_x = 30
    button_width = 50
    frame = [[button_x, button_y], [button_width, button_height]]
    @prevButton = button('<<', 'previousAyat', frame)

    button_x = button_x + button_width + distance_between_buttons
    button_width = 110
    frame = [[button_x, button_y], [button_width, button_height]]
    @istikharaButton = button('New Istikhara', 'nextTapped', frame)

    button_x = button_x + button_width + distance_between_buttons
    button_width = 50
    frame = [[button_x, button_y], [button_width, button_height]]
    @nextButton = button('>>', 'nextAyat', frame)

    self.view.addSubview @textView
    self.view.addSubview @istikharaButton
    self.view.addSubview @prevButton
    self.view.addSubview @nextButton
  end

  def nextTapped
    @textView.text = randomAyah
  end

  def previousAyat
    @ayatNumber -= 1
    @textView.text = @contents[@ayatNumber]
  end

  def nextAyat
    @ayatNumber += 1
    @textView.text = @contents[@ayatNumber]
  end

  def button(title, action, frame)
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle(title, forState:UIControlStateNormal)
    button.addTarget(self, action:action, forControlEvents:UIControlEventTouchUpInside)
    button.frame = frame
    button
  end

  def alert(title, message, cancelButtonTitle="OK", delegate=nil, otherButtonTitle=nil)
    UIAlertView.alloc.initWithTitle(title,
      message: message,
      delegate: delegate,
      cancelButtonTitle: cancelButtonTitle,
      otherButtonTitles: otherButtonTitle)
  end

  def textView(message)
    x = 30
    y = 70
    width = 260
    height = 320

    textView = UITextView.alloc.initWithFrame(CGRectMake(x,y,width,height))
    textView.text = message
    textView.font = UIFont.systemFontOfSize(30)
    textView.textColor = UIColor.blackColor
    textView.editable = false
    textView.scrollEnabled = true
    textView.textAlignment = UITextAlignmentRight
    textView.layer.backgroundColor = UIColor.clearColor.CGColor
    textView.layer.borderColor = UIColor.lightGrayColor.CGColor
    textView.layer.borderWidth = 1.0    
    textView
  end

  def randomAyah
    @ayatNumber = rand(6235)
    @contents[@ayatNumber]
  end

end
