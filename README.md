# JcvsToGit
Export JediVcs history in Git fast-import format

# What is it
- This projects allows to export all or a part of a JediVcs repository into a format acceptable for Git fast-import.
- This version uses the DBIsam Database.
- The goal is to transform a projet based repository to a directory based one.
- It transforms the modules checkin to dayly users commits, the checkin comments are reassembled and duplicates are removed.
- if a module is checked in by more than one user a day, there will be several commits for that day, one for each user change on the timeline

# Build instructions
Building was tested with Delphi 2007 and Delphi Xe8.

It need DBIsam Vcl  to be installed or at least the trial version (http://www.elevatesoft.com/download?category=dbisam).

##Delphi 2007
I am using VclZip from http://vclzip.bizland.com/, it should work with a trial version
Compile the project JVcsToGit_D2007.dproj and it is done

##Delphi Xe8
As Xe8 has System.Zip included, there is no need for external libraries
the USE_VCLZIP has to be undefined
Compile the project JVcsToGit_XE8 and it is done

# How to use it
Do the following steps
- first make a backup of your JediVcs repository and work on that backup
- JediVcs use DBIsam V3.X and the currently available Dbisam Vcl library is V4.x so a conversion is needed, just click the ConvertDatabase button on the upper right
- next analyze the paths from the repo : click on Get All Modules Path from DB, this will fill the leftmost grid with all the paths from the repo and show modules count for each path. This will also populate the Users grid where you have to enter a email address for each user.
- be sure to fill the "Begin of path to skip" edit box, this will allow to remove the beginning of the path from each module's path (Git has relative and Jvcs absolute paths)
- Now you have the choice to export either the full repo for a base or just one path with no subdirs
- To export the full repo, fill in the "Base Path" box and click on "export base path" (the Filename box contains the output file name, located near the executable).
- To export one line, just click on "Export curent line".
- the grid on the right will be fille with the commits id, date, user and modules id's and the commit comments.
- the resulting file can now be imported into git `git fast-import < filename` where filename is the exported file.

Enjoy !


