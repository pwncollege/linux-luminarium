#!/bin/bash

GAME_POINTS=0
NEXT_TARGET=""

function crumb_message {
	case $RANDOM % 4 in
		0)
			/bin/fold -s <<< "Good job so far! Your next target is: $NEXT_TARGET"
			;;
		1)
			/bin/fold -s <<< "You wanted a flag, but instead the road continues. Go on to $NEXT_TARGET"
			;;
		2)
			/bin/fold -s <<< "The journey is its own reward, and it continues to $NEXT_TARGET"
			;;
		3)
			/bin/fold -s <<< "$NEXT_TARGET awaits. For now, seek your fortune:"
			/bin/fortune
			;;
)

function random_subdir {
	DIR=$1
	ls -d "$DIR"*/ | sort -R | head -n1 | head -c-2
}

function choose_next_target {
	SLASHES="${PWD//[^\/]}"

	NUM_SUBDIRS=$(ls -d */ 2>/dev/null | grep -v "${DIRFILTER[@]}" -l)
	NUM_SUB_SUBDIRS=$(ls -d */*/ 2>/dev/null | wc -l)
	NUM_SUB_SUB_SUBDIRS=$(ls -d */*/*/ 2>/dev/null | wc -l)

	if [ -z "$NEXT_TARGET" ] || [ $NUM_SUBDIRS -eq 0 ]
	then
		NEXT_TARGET=$(random_subdir /)
	elif [ $NUM_SUB_SUBDIRS -gt 0 ] && [ "$RANDOM" % 10 -eq 0 ]
	then
		NEXT_TARGET=$(random_subdir */*/)
	elif [ $NUM_SUBDIRS -gt 0 ] && [ "$RANDOM" % 10 -eq 0 ]
	then
		NEXT_TARGET=$(random_subdir */)
	elif [ ${#SLASHES} -gt 2 ] && [ "$RANDOM" % 10 -eq 0 ]
	then
		NEXT_TARGET=$(random_subdir ../)
	elif [ ${#SLASHES} -gt 3 ] && [ "$RANDOM" % 10 -eq 0 ]
	then
		NEXT_TARGET=$(random_subdir ../../)
	elif [ ${#SLASHES} -gt 2 ] && [ "$RANDOM" % 10 -eq 0 ]
	then
		NEXT_TARGET=$(readlink ../)
	elif [ ${#SLASHES} -gt 3 ] && [ "$RANDOM" % 10 -eq 0 ]
	then
		NEXT_TARGET=$(readlink ../../)
	elif [ $NUM_SUBDIRS -gt 0 ]
	then
		NEXT_TARGET=$(random_subdir)
	else
		echo "UNEXPECTED SITUATION! PLEASE COMPLAIN TO THE PROFESSORS. Trying to recover..."
		choose_next_target
	fi
}

function the_game {
	if [ "$GAME_POINTS" -eq 15 ]
	then
		# we won the game; let's give the flag password
		FLA=$FLA FLB=$FLB /challenge/.copy_flag
	elif [ "$PWD" == "$HOME" ]
	then
		fold -s <<< 'Are you ready to leave $HOME? Your journey begins in /. Make your way and find the first breadcrumb!'
	elif [ "$PWD" == "$NEXT_TARGET" ]
	then
		$((GAME_POINT += 1 + $RANDOM % 2))
		crumb_message | /challenge/.write_target
		NEXT_TARGET=$(choose_next_target "$NEXT_TARGET")
	fi


}

PROMPT_COMMAND="the_game"
