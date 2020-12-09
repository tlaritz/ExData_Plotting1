This project consists of the following .R files:

1. png1.R                  # top level function generating plot1.png
2. png2.R                  # top level function generating plot2.png
3. png3.R                  # top level function generating plot3.png
4. png4.R                  # top level function generating plot4.png
5. setup.R                 # Helper function which downloads and unzips .txt  
                             file and adds an elapsed time column to data table
6. file_formating.R        # Helper function which assigns date and day 
                             formating constants
7. get_tick_mark_info.R    # Helper function which generates tic location and                                   labels to meet project specs

Calling sequence/methodology:

1. At R prompt: data <- setup()
2. At R prompt: pngx(data)        # x is a value from 1 to 4 inclusive

Notes:
1. Only those rows which are required are read in from the .txt file,
   reducing RAM required to run the code.
2. png2() and png3() are designed to be called either individually or
   by png4().  This allows the same code to be used to produced identical
   graph whether occurring individually or as a sub-graph produced by
   png4().
3. The .png files are located in the figure subdirectory.   