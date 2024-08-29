#!/bin/bash

#  Compile the Java source files
javac Main.java

#  Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful. Running the program."
    
    #  Run the compiled Java program
    java Main
    
    # build or Package the application into a JAR file
    jar cfe MyApp.jar Main Main.class
    
    echo "JAR file created: MyApp.jar"
else
    echo "Creation failed."
fi
