class IstikharaViewController < UIViewController
  def loadView
    self.view = UIImageView.alloc.initWithImage(UIImage.imageNamed("background"))
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    orientation == UIInterfaceOrientationPortrait
  end

  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskPortrait
  end

  def viewDidLoad
    super
    view.addSubview(duaLabel)
    view.addSubview(instructionLabel)
    view.userInteractionEnabled = true
    recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:'loadIstikhara')
    view.addGestureRecognizer(recognizer)
  end

  def duaLabel
    label = UILabel.alloc.initWithFrame([[10, 200], [300, 120]])
    label.backgroundColor = UIColor.clearColor
    label.numberOfLines = 2
    label.text = "اَسْتَخِيرُٱللّهَ بِرَحْمَتِهِ خِيَرَةً فِي عَافِيَةٍ"
    label.font = UIFont.fontWithName(fontName, size:30)
    label.textColor = UIColor.blackColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def instructionLabel
    label = UILabel.alloc.initWithFrame([[10, 400], [300, 40]])
    label.backgroundColor = UIColor.clearColor
    label.text = "Tap when ready for Istikhara"
    label.font = UIFont.fontWithName("Helvetica", size:20)
    label.textColor = UIColor.blackColor
    label.textAlignment = UITextAlignmentCenter
    label
  end

  def loadIstikhara
    filePath = NSBundle.mainBundle.pathForResource("quran-uthmani", ofType:"txt")
    translationPath = NSBundle.mainBundle.pathForResource("en.qarai", ofType:"txt")
    @contents = File.open(filePath) { |file| file.readlines }
    @translation = File.open(translationPath) { |file| file.readlines }

    self.view = UIView.new
    self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed("background"))

    message = randomAyah

    @textView = textView(message)

    button_y = UIScreen.mainScreen.bounds.size.height - 70
    button_height = 40
    distance_between_buttons = 25

    button_x = 30
    button_width = 50
    frame = [[button_x, button_y], [button_width, button_height]]
    @prevButton = button('<<', 'nextAyat', frame)

    button_x = button_x + button_width + distance_between_buttons
    button_width = 110
    frame = [[button_x, button_y], [button_width, button_height]]
    @istikharaButton = button('New Istikhara', 'nextTapped', frame)

    button_x = button_x + button_width + distance_between_buttons
    button_width = 50
    frame = [[button_x, button_y], [button_width, button_height]]
    @nextButton = button('>>', 'previousAyat', frame)

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
    @textView.text = Ayat.new(@contents[@ayatNumber]).to_s
  end

  def nextAyat
    @ayatNumber += 1
    @textView.text = Ayat.new(@contents[@ayatNumber]).to_s
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
    height = UIScreen.mainScreen.bounds.size.height - 160

    textView = UITextView.alloc.initWithFrame(CGRectMake(x,y,width,height))
    textView.text = message
    textView.font = UIFont.fontWithName(fontName, size:30)
    textView.textColor = UIColor.blackColor
    textView.editable = false
    textView.scrollEnabled = true
    textView.textAlignment = UITextAlignmentRight
    textView.layer.backgroundColor = UIColor.clearColor.CGColor
    #textView.layer.borderWidth = 1.0
    textView
  end

  def fontName
    fonts = ["Lateef", "KFGQPC Uthman Taha Naskh", "Scheherazade"]
    fonts[0]
  end

  def randomAyah
    @ayatNumber = rand(6235)
    ayatText = Ayat.new(@contents[@ayatNumber]).to_s
    translationText = @translation[@ayatNumber].gsub(".", "").chomp
    "#{ayatText}\n#{translationText}"
  end

end
