r-bor
=====

Model 3D trees (grown with algorithms) using Ruby, NoSQL, and Sketchup.

### Installation

+ Fork this repository.
+ Clone your fork. `git clone git@github.com:{your-username}/r-bor.git`
+ Lastly, to install the support file, run `rake rbor:install`.

Because Sketchup doesn't play nicely with gems, and requires you locate the plugin in a specific location, __rbor__ installs a support file in the plugins directory which loads the files in this repository.

That means you can always use this repo wherever it is, run the rake task, and the support file will tell Sketchup where to find this code.



### Code Structure

Persists trees using a recursive MongoDB structure. View generated in Sketchup.

+ Model:      MongoDB
+ Controller: Ruby
+ View:       Sketchup



### Notes

Presently for Mac only, might happen to work on Linux. Please contribute to support Windows.