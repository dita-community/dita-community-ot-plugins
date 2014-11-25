DITA Community Open Toolkit Plugins
===============

This repository serves to organize the various DITA Community plugins
into a single project, where each plugin is a separate git submodule. 
This makes it easier to work with the plugin projects as a unit.

This project also provides release packages of all the plugins.

If you clone or fork this repository, you must then initialize the
submodules in order to get the source for each plugin, using the "git submodule init" and 
"git submodule update" commands
in the dita-ot-plugins directory, e.g.:

~~~~
cd ~/workspace
cd clone https://github.com/dita-community/dita-community-ot-plugins.git
cd dita-community-ot-plugins
git submodule init
git submodule update
git submodule foreach git checkout master
~~~

After running these commands, you should have an up-to-date repo for each plugin, checked out to the branch "master".

If any plugin is updated, you can update your local repo using the command:

~~~~
git submodule foreach git pull
~~~~

You can use the script "submoduleAll.sh" to add the plugin submodules to any git repo. For example, if you make your DITA Open Toolkit directory into a git repo then you can add these plugins as submodules under the plugins/ directory.

The Ant build.xml script also provides the target "deploy-toolkit-plugins" which will copy the plugins to the configured Open Toolkit and integrate them for you. You need to set the Ant property "dita-ot-dir" to the location of your Open Toolkit. You can do this on the Ant command line with the "-Ddita-ot-dir={path to your OT}" parameter or create a file named "build.properties" or ".build.properties" in either the project directory or in your home directory and set the property there, e.g.:

~~~~
dita-ot-dir=/Users/ekimber/DITA-OT
~~~~

## Contributing to the DITA Community organization

If you would like to contribute a plugin to the DITA Community organization, contact one of the DITA Community organization owners and we'll set up a repository for you and add the plugin to this project as a submodule.

Contact: ekimber@dita-community.org


If you are interested in being a member of the DITA Community Github project team,
please contact one of the team members or create an issue indicating that you'd
like to contribute. We can always use help maintaining the repository.
  
## Other Sources of Plugins

* The DITA Open Toolkit is available at http://dita-ot.github.io 
* DITA for Publishers provides a number of plugins, including EPUB, HTML5, and 
  enhanced HTML output. It also provides a general map-driven framework that
  can be used by other plugins. http://dita4publishers.sourceforge.net
* The DITA Users Yahoo Group (https://groups.yahoo.com/neo/groups/dita-users/info) 
  has a files area that includes community-contributed plugins.  

   
   
