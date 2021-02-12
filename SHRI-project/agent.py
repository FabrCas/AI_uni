from dbHandler import *
from colorama import init, Fore, Back, Style
import re # import regular expression

class Agent():
    def __init__(self, name, speaker,listener):
        self.name = name
        self.speaker = speaker
        self.listener = listener

        # frame definition (predefined sequence) based on templates dictionary
        self.templates ={
            #general information
            "ask_all_about_office":["What do you know about this office", "tell me something about this office",
                                    "talk me about this office"],
            "bot_name": ["what's your name?", "what is your name", "tell me your name"],
            "shutdown": []
        }

    def match_template(self, command):
        for k in self.templates:
            for i, pattern in enumerate(self.templates[k]):
                match = re.search(pattern, command)
                if match:
                    return k, i
        return None, 0

    def parse(self,command):
        key, element = self.match_template(command)
        if key:
            self.processResponse(key, self.templates[key][element], command)
        else:
            self.notUnderstood_message()

    def processResponse(self, key, elem, user_command):
        # slot filling for the user response
        if key == "bot_name":
            message = "Mi name is " + self.name + ".\n" + "isn't it beautiful?"
            print(Fore.LIGHTYELLOW_EX + message)
            self.speaker.speak(message)
            while True:
                command = self.listener.listen()
                command = command.strip().lower()
                if "yes" in command.split():
                    message = "I knew you would appreciate it"
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)
                    break
                elif "no" in command.split():
                    message ="They are just different opinions"
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)
                    break
                else:
                    message="I didn't understand correctly, what do you think about?"
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)


    # **************************************** useful predefined message **************************************
    def ok_message(self):
        print(Fore.LIGHTYELLOW_EX + "ok")
        self.speaker.speak("ok")

    def tell(self, sentence):
        print(Fore.LIGHTYELLOW_EX + sentence)
        self.speaker.speak(sentence)

    def unkwnown_message(self):
        print(Fore.LIGHTRED_EX + "I am sorry, I don't have this information")
        self.speaker.speak("I am sorry, I don't have this information")

    def notUnderstood_message(self):
        print(Fore.LIGHTRED_EX + "I didn't understand what you said, please repeat")
        self.speaker.speak("I didn't understand what you said, please repeat")

    def attendApprovation(self):
        msg = "Are you sure?"
        print(Fore.LIGHTYELLOW_EX + msg)
        self.speaker.speak(msg)

        command = self.listener.listen()
        command = command.strip().lower()
        print(Fore.LIGHTGREEN_EX + command)

        while command != "yes" and command != "no":
            print(Fore.LIGHTRED_EX + "you must answer yes or not")
            command = self.listener.listen()
            command = command.strip().lower()
            print(Fore.LIGHTGREEN_EX + command)
        if command == "yes": return True
        else: return False


