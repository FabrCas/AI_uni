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
            #********************************* general information template ********************************************
            "bot_name": ["what's your name?", "what is your name", "tell me your name"],

            "shutdown": ['bye', 'exit', 'goodbye', 'bye-bye', 'see you soon'],

            # ******************************** office template *********************************************************
            "ask_all_about_office":["what do you know about this office", "describe what you know of the office",
                                    "tell me something about this office",
                                    "talk to me about this office",  "tell me about what you know of this office"
                                    "tell me something about the office", "tell me something about the office"
                                    "what do you know about the office", "tell me what you know about the office"
                                    "what do you know about this office", "what do you know about this office"],

            "ask_about_object":["where is the (?P<object_name>[\w\s]+)"],
                                #"talk to me about (?P<object_name>[a-z]+)",  "tell me about what you know of (?P<object_name>[a-z]+)",
                                #   "what do you know about (?P<object_name>[a-z]+)", "tell me what you know about (?P<object_name>[a-z]+)"],

            "exist_object": ["there is the (?P<object_name>[\w\s]+) in this office", "there is a (?P<object_name>[\w\s]+) in this office",
                             "there is the (?P<object_name>[\w\s]+) in the office",
                             "there is a (?P<object_name>[\w\s]+) in the office",
                             "exist the (?P<object_name>[\w\s]+) in this office", "exist the (?P<object_name>[\w\s]+) in this office",
                            "is there the (?P<object_name>[\w\s]+)", "is there a (?P<object_name>[\w\s]+)"],

            "save_object": ["i want to save an object", "save an object",
                            "can you save an object","save this object", "i need that you save an object"],

            "delete_object": ["i want to delete an object", "delete an object",
                            "can you delete an object","delete this object", "i need that you delete an object"],

            # ************************************+ agenda templates **************************************************

            "show_agenda": ["can you read my agenda", "show me my agenda", "tell me my commitments", "read my agenda",
                            "tell me my appointments", "show me the agenda"],

            "save_event": ["i want to save an event", "save an event", "save an event in the agenda",
                            "can you save an event", "save this event", "i need that you save an event",
                           "save this appointment","save this commitment", "store an appointment"
                           "store this commitment", "store an event" ],

            "delete_event": ["i want to delete an event", "delete an event", "delete an event in the agenda",
                            "can you delete an event", "delete this event", "i need that you delete an event",
                             "delete this appointment","delete this commitment", "cancel an appointment",
                           "cancel this commitment", "cancel an event"],
        }

    def match_template(self, command):
        for k in self.templates:
            for i, pattern in enumerate(self.templates[k]):
                match = re.search(pattern, command)
                if match:
                    return k, i, match
        return None, 0, match

    def parse(self,command):
        print("parsing...")
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

        # ************************************** actions for the office ************************************************

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
                    if info != None:
                        msg = msg + "additional information are: " + info + "\n"
                    break
            if msg == "":
                msg = "I don't have information about " + object_name
            print(Fore.LIGHTYELLOW_EX + msg)
            self.speaker.speak(msg)
        elif key == "exist_object":
            object_name = match.group("object_name")
            print(object_name)
            object_name= object_name.lower()
            msg = ""
            items = db.showRowsODB()
            for item in items:
                if item[1] == object_name:
                    msg = "Yes this object is present in this office "
                    pos = item[2]
                    msg = msg + "and it's located in the following position: " + pos + "\n"
                    break
            if msg == "":
                msg = "I don't have information about " + object_name
            print(Fore.LIGHTYELLOW_EX + msg)
            self.speaker.speak(msg)

        elif key == "save_object":
            message = "Please tell me the object that you want to save"
            print(Fore.LIGHTYELLOW_EX + message)
            self.speaker.speak(message)
            while True:
                command = self.listener.listen()
                command = command.lower()
                message = "is the {}".format(command) + " the object that you want to save?"
                print(Fore.LIGHTYELLOW_EX + message)
                self.speaker.speak(message)
                response = self.attendApprovation()
                if response:
                    item = command
                    message = "Please tell me now its position"
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)
                    while True:
                        command = self.listener.listen()
                        command = command.lower()
                        message = "is the {}".format(command) + " the object position?"
                        print(Fore.LIGHTYELLOW_EX + message)
                        self.speaker.speak(message)
                        response = self.attendApprovation()
                        if response:
                            position = command
                            db.addRowODB(item,position,None)
                            message = "The object has been successfully added in the knowledge base"
                            print(Fore.LIGHTYELLOW_EX + message)
                            self.speaker.speak(message)
                            break
                        else:
                            msg = "Therefore, repeat please"
                            print(Fore.LIGHTYELLOW_EX + msg)
                            self.speaker.speak(msg)
                    break
                else:
                    msg = "Therefore, repeat please"
                    print(Fore.LIGHTYELLOW_EX + msg)
                    self.speaker.speak(msg)
        elif key == "delete_object":
            message = "Please tell me the object that you want to delete"
            print(Fore.LIGHTYELLOW_EX + message)
            self.speaker.speak(message)
            while True:
                command = self.listener.listen()
                command = command.lower()
                message = "is the {}".format(command) + " the object that you want to delete?"
                print(Fore.LIGHTYELLOW_EX + message)
                self.speaker.speak(message)
                response = self.attendApprovation()
                if response:
                    item = command
                    db.deleteByNameODB(item)
                    message = "The object has been successfully removed from the knowledge base"
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)
                    break
                else:
                    msg = "Therefore, repeat please"
                    print(Fore.LIGHTYELLOW_EX + msg)
                    self.speaker.speak(msg)
        # ************************************** actions for the agenda ************************************************
        elif key == "show_agenda":
            message = "The following are you're appointment saved in the agenda: \n"
            print(Fore.LIGHTYELLOW_EX + message)
            self.speaker.speak(message)
            items = db.showRowsADB()
            index = 0
            for item in items:
                index += 1
                message = "Appointment number {} \n".format(index)
                message = message + " event: {}, ".format(item[2])
                message = message + " date: {} \n".format(item[1])
                print(Fore.LIGHTYELLOW_EX + message)
                self.speaker.speak(message)
        elif key == "save_event":
            message = "Please tell me the event that you want to save in the agenda"
            print(Fore.LIGHTYELLOW_EX + message)
            self.speaker.speak(message)
            while True:
                command = self.listener.listen()
                command = command.lower()
                message = "is the {}".format(command) + " the event that you want to save?"
                print(Fore.LIGHTYELLOW_EX + message)
                self.speaker.speak(message)
                response = self.attendApprovation()
                if response:
                    event = command
                    message = "Please tell me now its date "
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)
                    while True:
                        command = self.listener.listen()
                        command = command.lower()
                        message = "is the {}".format(command) + " the date?"
                        print(Fore.LIGHTYELLOW_EX + message)
                        self.speaker.speak(message)
                        response = self.attendApprovation()
                        if response:
                            date = command
                            db.addRowADB(date,event,None)
                            message = "The event has been successfully added in the knowledge base"
                            print(Fore.LIGHTYELLOW_EX + message)
                            self.speaker.speak(message)
                            break
                        else:
                            msg = "Therefore, repeat please"
                            print(Fore.LIGHTYELLOW_EX + msg)
                            self.speaker.speak(msg)
                    break
                else:
                    msg = "Therefore, repeat please"
                    print(Fore.LIGHTYELLOW_EX + msg)
                    self.speaker.speak(msg)
        elif key == "delete_event":
            message = "Please tell me the event that you want to delete"
            print(Fore.LIGHTYELLOW_EX + message)
            self.speaker.speak(message)
            while True:
                command = self.listener.listen()
                command = command.lower()
                message = "is the {}".format(command) + " the event that you want to delete?"
                print(Fore.LIGHTYELLOW_EX + message)
                self.speaker.speak(message)
                response = self.attendApprovation()
                if response:
                    event = command
                    db.deleteByEventADB(event)
                    message = "The event has been successfully removed from the agenda stored in the knowledge base"
                    print(Fore.LIGHTYELLOW_EX + message)
                    self.speaker.speak(message)
                    break
                else:
                    msg = "Therefore, repeat please"
                    print(Fore.LIGHTYELLOW_EX + msg)
                    self.speaker.speak(msg)





    # **************************************** useful predefined message **************************************
    def attendApprovation(self):

        command = self.listener.listen()
        command = command.strip().lower()
        print(Fore.LIGHTGREEN_EX + command)

        while not ("yes" in command.split()) and  not ("no" in command.split()):
            msg = "you must answer yes or not, please repeat"
            print(Fore.LIGHTRED_EX + msg)
            self.speaker.speak(msg)
            command = self.listener.listen()
            command = command.strip().lower()
            print(Fore.LIGHTGREEN_EX + command)
        if "yes" in command.split(): return True
        else: return False

    def ok_message(self):
        print(Fore.LIGHTYELLOW_EX + "ok")
        self.speaker.speak("ok")

    def notUnderstood_message(self):
        print(Fore.LIGHTRED_EX + "I didn't understand what you said, please repeat")
        self.speaker.speak("I didn't understand what you said, please repeat")




