//
//  ViewController.m
//  BullsEye
//
//  Created by Felipe Amaral on 2/3/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int _sliderValue;
int _objectiveValue;
int _points;
int _score;
int _round;
NSString *title;

- (void)newRound {
	_objectiveValue = 1 + arc4random_uniform(100);
	self.slider.value = 50;
	[self updateLabels];
}

- (void)updateLabels {
	self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
	self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
	self.targetLabel.text = [NSString stringWithFormat:@"%d", _objectiveValue];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	_round = 1;
	_score = 0;
	[self newRound];
}

-(void)calculateScore {
	if (_objectiveValue == _sliderValue) {
		_points = 100;
	}
	else if (_objectiveValue > _sliderValue) {
		_points = 100 - (_objectiveValue - _sliderValue);
	}
	else if (_sliderValue > _objectiveValue) {
		_points = 100 - (_sliderValue - _objectiveValue);
	}
	else {
		_points = 0;
	}
	
	if (_points == 100) { title = @"Perfect!"; }
	else if (_points >= 95) { title = @"Almost hit the pot!"; }
	else if (_points <= 90) { title = @"Not there yet..."; }
	else { title = @"Far far away..."; }
	_score += _points;
}

- (IBAction)printCurrentSliderValue {
	_sliderValue = roundf(self.slider.value);
	NSLog(@"The current slider value ir: %d", _sliderValue);
}

- (IBAction)resetScore {
	_score = 0;
	_round = 1;
	[self newRound];
}

- (IBAction)showAlert {
	_sliderValue = roundf(self.slider.value);
	[self calculateScore];
	UIAlertController *alertController = [UIAlertController
																			 alertControllerWithTitle:title
																			 message:[NSString stringWithFormat:@"Your current value is: %d\nYour value goal is: %d\nYou scored %d points!", _sliderValue, _objectiveValue, _points]
																			 preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
	[alertController addAction:alertAction];
	[self presentViewController:alertController animated:true completion:nil];
	_round++;
	[self newRound];
	[self updateLabels];
}

- (IBAction)showDeveloperInfo {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Developer Info"
																																					 message:@"Developed by: Felipe Amaral\nWith ❤️ from Brazil." preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
	[alertController addAction:alertAction];
	[self showViewController:alertController sender:nil];
}

@end
