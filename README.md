# Two-player-Guessing-Game
A two player "Guess the Digit" game in Assembly language

The x86 assembly program is a two-player digit guessing game that operates in a DOS environment using interrupt-driven input and output. It first prompts Player 1 to enter a secret digit without echoing the input. The digit is stored after performing an ASCII-to-integer conversion by subtracting '0'.

The game then enters a loop where Player 2 repeatedly inputs a digit. The program compares it against the stored secret digit using CMP, executing conditional jumps to determine the appropriate response. If the guess is too high or too low, it displays the corresponding message and prompts another guess. If the guess is correct, the program prints a victory message and terminates.

All messages are displayed using DOS system calls, and the program is terminated with INT 21h, 4Ch. The loop structure ensures the game continues until Player 2 finds the correct number. 
