//
//  ViewController.h
//  BullsEye
//
//  Created by Felipe Amaral on 2/3/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)showAlert;
- (IBAction)printCurrentSliderValue;
- (IBAction)resetScore;

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

@end

