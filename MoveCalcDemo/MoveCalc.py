import os
from time import sleep
import pyautogui

# Open Windows Calculator
os.system('calc.exe')

# Find the location of where to put the mouse pointer to drag window
sleep(1)
calcDragPointLocation = pyautogui.locateOnScreen(".\MoveCalcDemo\images\calcDrag.png")
calcDragPoint = pyautogui.center(calcDragPointLocation)
calcDragPointX, calcDragPointY = calcDragPoint
pyautogui.moveTo(calcDragPointX, calcDragPointY, 1, pyautogui.easeInQuad)

# Move the window to the 4 corners of the screen
pyautogui.dragTo(100, 30, 1, button="left")
sleep(2)
pyautogui.dragTo(1500, 30, 1, button="left")
sleep(2)
pyautogui.dragTo(100, 450, 1, button="left")
sleep(2)
pyautogui.dragTo(1500, 450, 1, button="left")
sleep(2)

# Close the calculator app
pyautogui.hotkey('alt', 'f4')