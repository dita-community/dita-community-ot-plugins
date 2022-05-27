# DITA Community Open Toolkit Plugins

**NOTE:** 27 May 2022: Renamed branch "master" to "main", set "develop" as default branch.

To update your local clone, run these git commands:

```
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

This repository serves to organize the various DITA Community plugins
into a single project, where each plugin is a separate git submodule. 
This makes it easier to work with the plugin projects as a unit.

This project also provides release packages of all the plugins.

If you clone or fork this repository, use the `--recursive` flag to recursively 
clone and check out all the submodules:

```
git clone --recursive https://github.com/dita-community/dita-community-ot-plugins.git
```

If you don't use the `--recursive` flat you must initialize the
submodules in order to get the source for each plugin, using the `git submodule init` and `git submodule update` commands in the `dita-community-ot-plugins` directory, e.g.:

```bash
cd ~/workspace
cd clone https://github.com/dita-community/dita-community-ot-plugins.git
cd dita-community-ot-plugins
git submodule init
git submodule update
git submodule foreach git checkout master
```

After running these commands, you should have an up-to-date repo for each plugin, checked out to the branch `master`.

If any plugin is updated, you can update your local repo using the command:

```
git submodule foreach git pull
```

You can use the script `submoduleAll.sh` to add the plugin submodules to any git repo. For example, if you make your DITA Open Toolkit directory into a git repo then you can add these plugins as submodules under the `plugins/` directory.

The Ant `build.xml` script also provides the target `deploy-toolkit-plugins` which will copy the plugins to the configured Open Toolkit and integrate them for you. You need to set the Ant property `dita-ot-dir` to the location of your Open Toolkit. You can do this on the Ant command line with the `-Ddita-ot-dir={path to your OT}` parameter or create a file named `build.properties` or `.build.properties` in either the project directory or in your home directory and set the property there, e.g.:

```
dita-ot-dir=/Users/ekimber/DITA-OT
```

## Contributing to the DITA Community organization

If you would like to contribute a plugin to the DITA Community organization, contact one of the DITA Community organization owners and we'll set up a repository for you and add the plugin to this project as a submodule.

Contact: ekimber@dita-community.org


If you are interested in being a member of the DITA Community GitHub project team, please contact one of the team members or create an issue indicating that you'd like to contribute. We can always use help maintaining the repository.

## Publishing plugins to the DITA OT plugin registry

Each plugin should be published to the DITA OT plugin registry.

To use this process you must have your own fork of the registry project (`https://github.com/dita-ot/registry`) that is cloned locally.
Set the property `registry.target` to the location of your local clone (e.g., using `.build.properties` or `build.properties`).

In addition, each plugin must have a `version.properties` file that defines the `version` property, e.g.:

```
version=1.0.1
```

The version number must be a two- or three-part number (this is required by the OT plugin registry).

This project's `registry` directory contains the plugins' registry JSON files. These files contain placeholder text that is automatically
replaced with the plugin's version and the plugin's Zip file checksum.

For each plugin there is (or should be), a "package._pluginname_" and a "release._pluginname_" ant target that sets the plugin name property and then calls the base targets. The pattern is pretty obvious in the Ant script.

The package process constructs a plugin Zip file that can then be added to GitHub as a release artifact. It also copies the JSON file to the configured registry clone, creates a branch specific to the plugin, commits the new or update JSON file, and pushes the branch to the origin remote, from which you can then create a pull request to the DITA OT registry project when you're ready to release.

The release process creates a release for the plugin in the plugin's project on GitHub.

*NOTE:* The release process is not yet working so you must currently create releases manually. 

## Other Sources of Plugins

* The DITA Open Toolkit is available at http://www.dita-ot.org. 
* DITA for Publishers provides a number of plugins, including EPUB, HTML5, and 
  enhanced HTML output. It also provides a general map-driven framework that
  can be used by other plugins. http://dita4publishers.sourceforge.net
* The [DITA Users Yahoo Group](https://groups.yahoo.com/neo/groups/dita-users/info) has a files area that includes community-contributed plugins.  
