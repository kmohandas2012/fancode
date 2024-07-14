# fancode
- Install python from https://www.python.org/downloads/windows/
- The IDE I've used is PyCharm. You can download the same from https://www.jetbrains.com/pycharm/download/ 
- In PyCharm, setup a venv for your project by going to settings>Project: FanCode>Python Interpreter 
- Click on Add interpreter. Once the new page loads, select the new python which you installed from step 1
- Once all the above steps have been completed Install all the packages mentioned in the requirements.txt file.
- You can use pip install -r FanCode/requirements.txt for the same.
- Once the installation is done, open the terminal in pycharm, and make sure the desktop_tests folder is the current directory.
- Use robot followed by the test suite name which is fanCode.robot and click enter.
- The automation code will run and pass but at the same time it would throw a warning for all the user's who hasn't completed atleast 50% of their tasks