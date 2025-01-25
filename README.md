# Learn Spanish
![test](https://github.com/user-attachments/assets/54b60bdb-1173-4c79-afe2-7813d23e383b)
![test2](https://github.com/user-attachments/assets/63bbf390-7b85-40a0-a747-c95410b067e7)



## ✅ Features:
- Topics are displayed to the user using emojis to make the experience more engaging.
- Each topic contains a lesson, a practice mode, a quiz mode and a list of words for that topic. The user can mark the Lesson and the Practice as completed, but the Quiz will be marked as completed only when they have answered all the questions correctly.
- Practice Mode:
	- Words are randomized
	- Progress is displayed
	- `TabView,` using Page mode, to improve user experience. 
	- Animated
	- User can drag or tap the button to navigate.
	- English and Spanish definitions are different colors.
- Quiz Mode:
	- Displays the highest score, the current score and the questions left.
	- True or False
	- If the user answers before 20 seconds, and they answer correctly, they get bonus points. If they dont, they are informed they lost them
		- Time is displayed and animated using a liner `Progress Bar`. 
	- Inform the user if they answered correctly or not. If not, the app tells them which was the correct answer
	- Play a sound according to correct or incorrect answers
	- Let the user navigate to next question
	- When they are in the last question, they are taken back to the `Topic Intro` view.
- Persistance:
	- Scores, unlocked topics, completed lessons, and more are stored in the users device via `UserDefaults`. 
- Portrait/Landscape Mode works on all devices

## 🤨 To Improve:
- The main struggle I had was understanding the concepts of Animation. Because of that I did not implement cards that were flipped when tapped, in the `Practice `View.

## 🚀 Above and Beyond:
- I let the user know how many questions they have left in Quiz mode. If they are in the last question, they are informed as well.
- The app displays the Highest Score when in Practice mode, so that the user can know it in case they want to beat it.
- In Quiz mode, when the user hasn't answered in 20 seconds, they are notified that they lost the "Time Bonus".
- The topics will be locked until the user has completed the previous lesson. I made this to simulate different levels similar to Duolingo. 
