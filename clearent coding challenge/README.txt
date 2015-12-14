Howdy! Thanks for checking out my coding challenge. 



**Installation**

To run the code, you'll need to install Ruby and Cucumber. 

Ruby can be installed from http://rubyinstaller.org/

I'm using Windows 7, and the ruby 2.0.0p647 32-bit version of Ruby. 

Once Ruby is installed, go to Start -> Ruby(your version) -> Start Command Prompt with Ruby

Next, install cucumber by typing: gem install cucumber

That should be all. 



**What's In the Box**

This coding challenge has two parts--the challenge itself and a fuzz tester for the challenge. 

To run the challenge code, from the Ruby command prompt opened earlier, navigate to the directory above the features/ directory and type: cucumber -c features/Coding Challenge.feature. 

You should be met with 3 passing tests per the specs given in the challenge. 

The script in this directory called feature_generator.rb, will generate a random feature file in features\fuzz.feature. 

This feature file is for seeing if there are any cases that weren't thought of in the original tests--which it looks like, I didn't put logic in to handle floating point values for the interest per card/wallet/person. But, maybe that's ok, since it doesn't appear that was the focus (?) 

To run this feature, type cucumber -c features\fuzz.feature. 



Thanks again, 
Michael "Fritz" Fritzius