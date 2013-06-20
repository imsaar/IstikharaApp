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

    @textView = textView(message)

    button_y = 400
    button_height = 40

    button_x = 50
    button_width = 50
    frame = [[button_x, button_y], [button_width, button_height]]
    @prevButton = button('<<', 'previousAyat', frame)

    button_x = 108
    button_width = 100
    frame = [[button_x, button_y], [button_width, button_height]]
    @istikharaButton = button('Istikhara', 'nextTapped', frame)

    button_x = 216
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
    x = 50
    y = 80
    width = 220
    height = 300

    textView = UITextView.alloc.initWithFrame(CGRectMake(x,y,width,height))
    textView.text = message
    textView.font = UIFont.systemFontOfSize(30)
    textView.textColor = UIColor.blackColor
    textView.editable = false
    textView.scrollEnabled = true
    textView.textAlignment = UITextAlignmentRight
    textView.layer.borderColor = UIColor.grayColor.CGColor
    textView.layer.borderWidth = 3.0    
    textView
  end

  def randomAyah
    @ayatNumber = rand(6235)
    @contents[@ayatNumber]
  end

end
