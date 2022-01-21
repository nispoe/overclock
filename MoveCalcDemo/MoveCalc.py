import os
import pyautogui

# Open Windows Calculator
# os.system('calc.exe')
# pyautogui.click(x=1, y=1)

pyautogui.click(".\MoveCalcDemo\images\standardButton.png")

# calcDragPointLocation = pyautogui.locateOnScreen(".\MoveCalcDemo\images\calcDragPoint.png")
# calcDragPoint = pyautogui.center(calcDragPointLocation)
# calcDragPointX, calcDragPointY = calcDragPoint
# pyautogui.moveTo(calcDragPointX, calcDragPointY, 1, pyautogui.easeInQuad)

# pyautogui.dragTo(125, 50, 1, button="left")

# pyautogui.click(".\MoveCalcDemo\images\a.png")


# calcStandardLocation = pyautogui.locateOnScreen(".\MoveCalcDemo\images\standardButton.png")
# calcStandardPoint = pyautogui.center(calcStandardLocation)
# calcStandardButtonX, calcStandardButtonY = calcStandardPoint
# pyautogui.moveTo(calcStandardButtonX, calcStandardButtonY, 1, pyautogui.easeInQuad)