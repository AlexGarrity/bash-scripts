#
#   CreateProject
#   (C) Alex Garrity 2020
#

function __NP_CPP() {
    # Set the project name
    PROJECT_NAME=$1
    
    # Create a new folder in Development, cloned from the template, and cd to it
    cd ~/Development
    git clone git@github.com:AlexGarrity/CMake-Template "$PROJECT_NAME"
    cd $PROJECT_NAME
    
    # Remove the .git folder and create a new one
    rm -rf .git
    git init .
    
    # Rename the project, and fix the CMakeLists files
    mv "template/" "$PROJECT_NAME/"
    sed -i "s|template|$PROJECT_NAME|g" CMakeLists.txt
    sed -i "s|template|$PROJECT_NAME|g" "$PROJECT_NAME/CMakeLists.txt"
    
    # Create a README file
    echo "# $PROJECT_NAME" > README.md
    
    # Build the project template
    cd build
    CXX=clang++ CC=clang cmake -DTEST_ENABLE=TRUE -DTEST_GTEST=TRUE -S .. -B .
    make

    # Start vscode in the project directory
    code ..
    
    # Close the terminal
    exit
}

function __NP_PY() {
    # Set the project name
    PROJECT_NAME=$1
    
    # Create a new folder in Development using venv and cd into it
    cd ~/Development
    python3 -m venv $PROJECT_NAME
    cd $PROJECT_NAME
    
    # Initialise the git repo
    git init .
    
    # Create a README file
    echo "# $PROJECT_NAME" > README.md
    
    # Start vscode in the project directory
    code .
}

function NewProject() {
    # Check that we have enough parameters
    if [ "$1" == "" ] ; then
        echo "Usage:  NewProject <Language> <Name>"
        echo "(Language not specified)"
    fi
    if [ "$2" == "" ]; then
        echo "Usage:  NewProject <Language> <Name>"
        echo "(Project name not specified)"
    fi
    
    # Replace spaces in project name with dashes
    PROJECT_NAME=`echo $2 | sed --expression='s|\s|-|g'`
    
    # Make a project
    if [ "$1" == "CPP" ]; then
        __NP_CPP $PROJECT_NAME
    elif [ "$1" == "PY" ]; then
        __NP_PY $PROJECT_NAME
    else
        echo "Language not available"
    fi
    
}

