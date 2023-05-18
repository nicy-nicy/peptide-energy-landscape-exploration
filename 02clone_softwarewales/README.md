# Clone softwarewales git repository                                          

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Git_Workflow

Summary
1. In your $HOME directory run
```
ssh-keygen -t rsa -C "GitLab"
```
2. On the GitLab website in softwarewales repository, click on the user icon
on the top right, select `Edit Profile`, select `SSH keys` under the User Settings
on the left, copy and paste the contents of public key ($HOME/.ssh/id_rsa.pub) in the `Key` box, fill out
the other options and click `Add key`. For detailed explanation check the reference given above.
3. Load the required modules and clone the softwarewales repository and AMBER12 submodule
in your $HOME directory. Check the reference given above if some problems occur.
```
cd $HOME
module load git/2.25.0
git lfs install
git clone git@gitlab.developers.cam.ac.uk:ch/wales/softwarewales.git
cd $HOME/softwarewales/
git submodule init AMBER12
git submodule update
```

