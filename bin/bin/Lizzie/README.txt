Lizzie Version 0.7 - Mac/Linux

INSTALLATION
	In order to run, Lizzie needs 
		- Java 8 or higher. Please install the official version of Java from https://java.com. (OpenJDK might work, but some users have had issues with it.)
		- a copy of Leela Zero version 0.17 or higher. You must compile Leela Zero from either the "master" or "next" branch of the Leela Zero repository. To do this, follow these steps:

	### Example of compiling Leela Zero - Ubuntu ###
		# Test for OpenCL support & compatibility - only necessary if you intend to install the GPU version (which is faster but requires a GPU)
		sudo apt install clinfo && clinfo

		# Clone github repo
		git clone https://github.com/gcp/leela-zero
		cd leela-zero/src
		sudo apt install libboost-dev libboost-program-options-dev libopenblas-dev opencl-headers ocl-icd-libopencl1 ocl-icd-opencl-dev zlib1g-dev

		!! OPTIONAL: if you want to compile the CPU-only version of Leela Zero, open config.h and replace the line
		!!     #define USE_OPENCL
		!!  with
		!!     //#define USE_OPENCL
		!!  You will also need to do the same for
		!!     #define USE_HALF

		# Compile Leela Zero
		make

		# Move the resulting 'leelaz' program to your Lizzie directory
		mv leelaz %DIRECTORY_OF_YOUR_LIZZIE_FOLDER%/leelaz

	### Example of compiling Leela Zero - macOS ###
		# Clone github repo
		git clone https://github.com/gcp/leela-zero
		cd leela-zero/src
		brew install boost

		!! OPTIONAL: if you want to compile the CPU-only version of Leela Zero, open config.h and replace the line
		!!     #define USE_OPENCL
		!!  with
		!!     //#define USE_OPENCL
		!!  You will also need to do the same for
		!!     #define USE_HALF

		# Compile Leela Zero
		make

		# Move the resulting 'leelaz' program to your Lizzie directory
		mv leelaz %DIRECTORY_OF_YOUR_LIZZIE_FOLDER%/leelaz

	### Other operating systems ###
		Please refer to https://github.com/gcp/leela-zero/blob/master/README.md#compiling

	### Optional KataGo ###
		Please install via https://github.com/lightvector/KataGo#linux, KataGo is not strictly necessary for Lizzie to run, however it has a territory estimation feature and will not make mistakes reading ladders.

	You are now done! Run Lizzie by 
		- double clicking on Lizzie.jar, or
		- running this command inside of the Lizzie directory:
			java -jar Lizzie.jar

	If you need additional support compiling Leela Zero, please visit https://github.com/gcp/leela-zero/issues
	If you need additional support setting up Lizzie, please visit https://github.com/featurecat/lizzie/issues


USAGE
	Open Lizzie.jar (either double click it, or run the command 'java -jar Lizzie.jar' to view console output / troubleshooting). Must have followed the INSTALLATION steps above.

	Hold down X while the program is running to see a list of shortcuts.

	The first run of the program may take a while to set up, as Leela Zero sets up the quick tuning. Feel free to replace the leelaz_opencl_tuning it creates with your own tuning. When Leela Zero finishes setting up, the board will display Leelaz's analysis.

	You can switch to KataGo or Leela Zero by clicking the Engine button on the toolbar. KataGo has a territory estimator and will not make ladder mistakes.

	# Note, KataGo takes longer to set up the first time than Leela Zero. It only needs to set up once.

CUSTOMIZATION - 
	Now you can customize Lizzie from within the interface! At the top of the screen will be a toolbar. Click settings to modify any component of Lizzie you wish.

	You can change the background / stone images / board image by replacing the files in the assets folder. Make sure you keep the same name of each file.

	Updating the network: by default, Lizzie 0.7 comes with an advanced LeelaZero 15-block network (trained by bubblesId/bjiyxo), and KataGo's July-generation final 20-block network. You may alternatively manually replace the [lznetwork.gz] file with your own, downloaded from zero.sjeng.org; make sure to give it the same filename and same filename extension as specified in the "weights" config setting.

	The advanced 15-block network should be roughly equal in strength to LZ#244 given equal time, but it evaluates playouts much faster and consumes less memory.

Please report bugs and make feature requests at https://github.com/featurecat/lizzie/issues

You can view the source code for this open source project at https://github.com/featurecat/lizzie