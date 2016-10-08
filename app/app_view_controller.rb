class AppViewController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    label = UILabel.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    label.text = "Hello World"
    label.textAlignment = NSTextAlignmentCenter
    label.font = UIFont.boldSystemFontOfSize(32)
    self.view.addSubview(label);
  end
end
