#!/bin/sh
# IS THIS WORKING???
# How this script should behave:
#
# INPUT:   Paths to one or more fasta sequence files
#
# OUTPUT:  For each file, it should write a line with the number of sequences
#          in the file, a space, and then the file NAME (NOT the path!), and a
#          final line with the total number of sequences across all files.
#
# EXAMPLE: In the same directory as this script, you should find an example
#          fasta file named 'example-seqs1.fasta', which contains:
#
#          >RMB3263_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#          
#          >CWL052_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#
#          If you run this script on this fasta file, you want to get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta
#          2 example-seqs1.fasta
#          2
#
#          There should be another example fasta file named
#          'example-seqs2.fasta', which contains:
#
#          >RMB7155_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7156_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7163_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          If you run this script on BOTH fasta files, you want to get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta example-seqs2.fasta
#          2 example-seqs1.fasta
#          3 example-seqs2.fasta
#          5
#
#
# Your goal is to work collaboratively with ~ 3 other people to edit this
# script until it passes all the tests that have been written for it. I.e., you
# should be able to run:
#
#   $ sh run_tests.sh
#
# and see 'All tests passed!' at the bottom of the output.
#
# To do this, one member of your group should fork this repository, and add the
# other members as collaborators, so that all members of the team can be
# pulling and pushing changes to the script to the collaborative remote
# repository on Github.
#
# HINTS
# The first thing you need to be able to do is access the paths to the fasta
# files that were 'given to' this script. The variable "$@" will be very useful
# for this. Let's take a look at what it gives us:

#echo "$@"

# How are you going to work with each file path?
# HINT: for loop (remember "for do done"?)
#
# To get the name of each file from the path, checkout the command 'basename':
#
#   $ man basename
#
# To count the number of sequences in each file, I recommend you checkout
# 'grep' and 'wc':
#
#   $ man grep 
#   $ man wc 
#
# WARNING about 'grep': ALWAYS quote the string that you are trying to find!
# For example, do:
#
#   $ grep "string I want to find" file-i-want-to-find-it-in.txt
#   **NOT**
#   $ grep string I want to find file-i-want-to-find-it-in.txt # DON'T DO THIS!
#
# To keep a tally of the total number of sequences across all files, 'expr'
# might be useful:
#
#   $ man expr 
#
# Good luck!
#
# ADD YOUR CODE BELOW:
#!/bin/bash

#<<<<<<< HEAD
#the number of sequence in the file
#seq1=`grep ">" $1 | wc -l`
#seq2=`grep ">" $2 | wc -l`

#the name of file
#name1=`$1`
#name2=`$2`


#the number of sequence of two files
#sum=`expr "($name1+$name2)"`

#echo "$sum"
#echo "$seq1 $name1" > .txt
#echo "$seq2 $name2" >> number.txt
#echo "$sum" >> number.txt


 
#=======
#<<<<<<< HEAD
# /bin/bash

# Defining variables 

#seq1=`grep ">" $1 | wc -l`
#seq2=`grep ">" $2 | wc -l`
#name1=`echo $1 | awk '{print $1}'`
#name2=`echo $2`
#sum=`expr $seq1 + $seq2`

# Echoing variables

#echo "$seq1 $name1"
#echo "$seq2 $name2"
#echo $sum
 
#=======


## a loop will run through the output for each file and keep track of the count so far

#ct=0

#<<<<<<< HEAD
#for x in #list of filepaths
#do
#	ct=`expr ct+$ct`
#done
#=======
#for x in "$@"   # $@ is nice because it's a list of the input arguments
#do
	# Defining variables
	#this counts number of sequences in the file
#	seq=`grep ">" $x | wc -l`

	#this is the counter that finds the total count between files
#	ct=`expr $ct+$seq`
	#"seq" will be the count of sequences in file "x"
#done
#>>>>>>> e5dde4025b4059fdcbf56999ccb787cd0bd734b4



## print out the total number of sequences across files

#<<<<<<< HEAD
#echo $ct
#>>>>>>> 778a2311df479565e5574be7062e112476eb838f
#=======
#echo $ct
#>>>>>>> 778a2311df479565e5574be7062e112476eb838f

#Use basename to strip directory and suffix from the filename
#basename line of code into loop

#>>>>>>> e5dde4025b4059fdcbf56999ccb787cd0bd734b4


####NEW LOOP AND VARIABLES
#seqs=(`cat $@ | grep ">"`)

#for ((x=0; x=<$#; x++))
#do
#	seqnum=`grep ">" ${seqs[$x]} | wc -l`
#	names=`echo ${seqs[$x]}`
#	echo "$seqnum $names"
#done
#>>>>>>> 7a8ce1d8ae843a26b8f366225284bc2894ce6623







#!/bin/sh

#get the last file 
for last in "$@";
do true;
done

#creat a file to store number
touch seqnumber.txt

for var in "$@"
do 
  name=$(basename "$var")
  echo "$(grep '>' $var | wc -l) $name" 
  echo "$(grep '>' $var | wc -l)" >> seqnumber.txt
  if [ $var = $last ]
  then 
      echo `awk '{sum +=$1} END { print sum}' seqnumber.txt`
  fi
done
