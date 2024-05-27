# 4. Build and download the application

## :mortar_board: Goal for this training chapter :mortar_board:

After this training chapter, you will:

- Be able to build the project
- Know how to download the application to a PLC
- Be able to simplify the process of building and downloading with scripting

### :raised_hands: Building the project (hands-on) :raised_hands:

1. Open the `apax.yml` and verify that the target `plcsim` and `1500` are present, add them if necessary.
2. Open the terminal by using the shortcut *ctrl+shift+`*
3. In the terminal execute the command `apax build`

The compiled binaries will be stored in the *bin* folder.

### :raised_hands: Downloading to the target (hands-on) :raised_hands:

1. Make sure that the hardware configuration is allready present in the target (downloaded with TIA portal for example).
2. Assuming that the target is a PLCSIM advanced instance, in the terminal excecute the following command;

```apax sld load --accept-security-disclaimer -i ".\\bin\\plcsim" -t 192.168.0.1 --mode full -l -r debug```

> Note: for a physical S7-1500 replace ".\\bin\\plcsim" by ".\\bin\\1500" also note that the -t (target) tag defines the IP of the target.

> Note: for more information about the tags used in the command use `apax sld load -h`

### :raised_hands: Simplyfing the process using Apax scripts (hands-on) :raised_hands:

1.  Open the `apax.yml` and add a `variables` section to the file and create a variable with the IP of the target;
```
variables:
  IP_PLC: 192.168.0.1
```
2. Now add a `scripts` section to the `apax.yml` and add a script for building and downloading the project to the target;
```
scripts:
  loadsim: apax sld load --accept-security-disclaimer -i ".\\bin\\plcsim" -t $IP_PLC --mode full -l debug
  blsim:                         //build and load the application to a plcsim instance
    - apax build
    - apax loadsim
```
3. Execute the script from the terminal by using the `apax blsim` command, the application will now build an download to the target IP_PLC

## :mortar_board: Summary :mortar_board:

Goal reached? Check yourself...

- you know how to build the project✔
- you know how to download the application to the target✔
- you are able to create a script to simplify the building and downloading process✔


[Continue with next chapter](./5-debug.md)

[Back to overview](./../README.md)