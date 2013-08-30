#### Just some quick tips:

On OSX, after installing `curl` you'll need to create the corresponding symlinks in order to replace Apple's bundled version. This is a simple matter of:

    brew link curl --force
    
**DO NOT DO THIS WITH RUBY**: the correct (and safest) approach is to use either [rbenv](https://github.com/sstephenson/rbenv) or [rvm](https://rvm.io).