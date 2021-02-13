import dbHandler as db
from colorama import init, Fore, Back, Style
import re # import regular expression

class Agent():
    def __init__(self, name, speaker,listener):
        self.name = name
        self.speaker = speaker
        self.listener = listener
        self.active = True

        # frame definition (predefined sequence) based on templates dictionary
        self.templates ={
            #general information
            "ask_all_about_office":["what do you know about this office", "tell me something about this office",
                                    "talk to me about this office",  "tell me about what you know of this office"
                                    "tell me something about the office", "tell me something about the office"
                                    "what do you know about the office", "tell me what you know about the office"
                                    "what do you know about this office"],
            "bot_name": ["what's your name?", "what is your name", "tell me your name"],
            "shutdown": ['bye', 'exit', 'goodbye','bye-bye','see you soon'],
            "ask_about_object":["where is the (?P<object_name>[\w\s]+)","what do you know about the (?P<object_name>[\w\s]+)" ],  # ["what do you know about (?P<object_name>[a-z]+)", "tell me something about (?P<object_name>[a-z]+)",
                                #    "talk to me about (?P<object_name>[a-z]+)",  "tell me about what you know of (?P<object_name>[a-z]+)"
                                #    "what do you know about (?P<object_name>[a-z]+)", "tell me what you know about (?P<object_name>[a-z]+)"],
            "ask_object_info": [],
            "ask_for_": []
        }

    def match_template(self, command):
        for k in self.templates:
            for i, pattern in enumerate(self.templates[k]):
                match = re.search(pattern, command)
                if match:
                    return k, i, match
        return None, 0, match

    def parse(self,command):
        key, element, match= self.match_template(command)
        if key:
            self.processResponse(key, self.templates[key][element], command, match)
        else:
            self.notUnderstood_message()

    def processResponse(self, key, elem, user_command, match):
        print(key)
        # slot filling for the user response
        if key == "shutdown":
            print(Back.BLUE + Fore.LIGHTBLACK_EX + "shutdown the chatbot...")
            self.speaker.speak("Bye bye")
            self.active = False
        elif  key == "bot_name":
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
        elif key == "ask_all_about_office":
            msg = "I have knowledge about the following objects in the room:\n"
            self.listener
            items = db.showRowsODB()
            for item in items:
                msg = msg + item[1] + "\n"
            msg = msg + "you can ask more datails about these, like position, and whether available, additional information"
            print(Fore.LIGHTYELLOW_EX+ msg)
            self.speaker.speak(msg)
        elif key == "ask_about_object":
            object_name = match.group("object_name")
            print(object_name)
            object_name= object_name.lower()
            msg = ""
            items = db.showRowsODB()
            for item in items:
                if item[1] == object_name:
                    msg = "The following information about " + item[1] + " are available:\n"
                    pos = item[2]
                    info = item[3]
                    msg = msg + "the position is: " + pos + "\n"
                    msg = msg + "additional information are: " + info + "\n"
                    break
            if msg == "":
                msg = "I don't have information about " + object_name
            print(Fore.LIGHTYELLOW_EX + msg)
            self.speaker.speak(msg)



    # **************************************** useful predefined message **************************************
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




