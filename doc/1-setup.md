# 1. Setting up a project using the Apax package manager

## :mortar_board: Goal for this training chapter :mortar_board:

After this training chapter, you will:

- know how to create a AX project
- have understanding of the AX project structure
- know the purpose of the `apax.yml`
- are able to install and update dependencies using the Apax extension
- know the difference between `devDependencies` and `dependencies`

### :raised_hands: Creating a new AX project (hands-on) :raised_hands:

1. Click on the **Apax icon** on the left side in the Activity Bar to show the Apax AX Code Extension GUI. This provides you a small setup wizard to create your new project.
2. Enter a Project Name in the wizard on the left side.
3. Click Browse and select an empty folder. Your project will be stored here.
   Select the Apax template for Application Project to initialize a new project with application sample code.
4. Click on Create Project to create the application.
5. Confirm the *Do you trust the authors of the files in this folder?* dialog by clicking on **Yes, I trust the authors**. Further infos about Workspace Trust can be found in the VS Code docs

> Note: the next chapter is information regarding the folder structure and apax package manager, the hands-on will [continue](:raised_hands:-Installing-packages-trough-Apax-(Hands-on)-:raised_hands:) after the information sections.

### :information_source: Introducing AX project folder structure (information) :information_source:

Once your project is created and opened, you will find the following files and folders present in your workspace:

- `.vscode/launch.json` this file contains the configuration for debugging.
- `src/configuration.st` this is where you can configure your ST program, there is some sample configuration present. More information about the configuration can be found in the official AX documentation.
- `src/program.st` contains some sample program code. Here the actual program logic can be written.
- `test/test.st` contains a sample AxUnit test fixture to test your program.
- `.gitignore` specifies intentionally untracked files and folders that Git ignores. For more infos about GIT
- `apax.yml` describes your application structure.

Depending on the tools used and installed more folders may be created. For example for compiled source code the `bin` folder is created, or for apax packages are installed the `.apax` folder is created.

### :information_source: Introducing apax.yml (information) :information_source:

> Note: If you are already familiar with `Apax` and the `apax.yml` you can skip this section.

The `apax.yml` defines the project, required dependecies and provides scripting for automating actions within the AX IDE. Since the `apax.yml` is the heart of the AX project it is important to have a good understanding of it's components.
The following chapters will discuss these components.

#### **Project information**

The header of this file includes some basic information about the project.

- `name: ` Contains the project name.
- `version: 0.0.1` the version of the library.
- `type: app` the project type.

#### Targets

The `targets` section contains the desired targets to compile the software for. In our case this is the `S7-1500`, but `plcsim` would also be a valid value.

#### **DevDependencies**

The `devDependencies` section contains development dependencies which are required during development.

#### **Dependencies** and **registries**

`Dependencies` are packages that contain code that will be executed. These can be for example libraries or system functions of the S7-1500. Registries are currently not in our apax.yml but can be used to add additional `registries` where other packages can be found. For example the from the node regristry of the [AX Community Github](https://github.com/simatic-ax).

#### Variables and scripts

The `scripts` section is used to describe several scripts which can be used to automate commands within Apax. For example the comand `create-tialib` will execute the commands `apax build`, `apax export-tialib` and `apax import-tialib`. This is usefull for automating jobs that normally would be executed from the terminal. The `variables` can be used as parameters to adjust the scripts. In this case the variables will provide the necesary paths for saving the binaries and TIA portal library file.

### :raised_hands: Installing packages trough Apax (Hands-on) :raised_hands:

In this training we'll make use of the **system-counters** library, `@ax/system-counters`. However if you inspected the `apax.yml` closely you might have seen that the `@ax/system-counters` package is not present in the dependecies list, and therefore not availible in the workspace. In this chapter we'll install this package.

1. In the sidebar open the `Apax tab`
2. Search for **system-counters**
3. **click** on the entry of **system-counters** and select version: **6.0.94** then click the install button, the library will now be installed as a dependency. And will be added to the dependencies in the `apax.yml`.

alternatively we can also install the package using the command line in AX code:

1. use **ctrl+shift+`** to open a new powershell panel.
2. use the command `apax add "@ax/system-timer": ^6.0.94` to install the latest version of the **system-counters** library. The package will now be installed and added to the dependencies in the `apax.yml`.

### :mortar_board: Summary :mortar_board:

Goal reached? Check yourself...

- you are able to create a new ax project ✔
- you know what the purpose of the apax.yml is ✔
- you have learned how to install packages ✔
- you know how to use the Apax extension ✔
- you know the difference between `devDependencies` and `dependencies` ✔

[Continue with next chapter](./2-coding.md)

[Back to overview](./../README.md)
