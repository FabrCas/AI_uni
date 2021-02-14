from asr_listener import Listener
from speaker import  Speaker
from colorama import init, Fore, Back, Style
from agent import Agent
import spacy

# initialize colorama and set default font style after each print
init(autoreset = True)
spacy_parse_dependency = False

def test_listener_speaker(listener,speaker):
    cmd = listener.listen()
    speaker.addMessage(cmd)
    speaker.speak()

if __name__ == "__main__":
    nlp = spacy.load("en_core_web_sm")
    listener = Listener()
    speaker = Speaker()
    agent = Agent("FC-21", speaker, listener)

    print(Back.BLUE + Fore.LIGHTBLACK_EX +  "Initializing the chatbot...")
    init_message = "Hi" # human, i'm an office robot, how can i help you?"
    print( Fore.LIGHTYELLOW_EX + init_message)
    speaker.speak(init_message)

    while agent.active:
        command = listener.listen()
        command = command.strip().lower()
        verb = None
        noun = None
        root = None
        if spacy_parse_dependency:
            doc = nlp(command)
            for token in doc:
                print(token.text, token.lemma_, token.pos_, token.tag_, token.dep_,
                      token.shape_, token.is_alpha, token.is_stop)
                if token.tag_ != None:
                    if token.dep_ == "ROOT":
                        root = token
                    if  token.tag_ == "VB" or token.tag_ == "VBZ":
                        verb = token
                    if  token.tag_ == "NN":
                        noun = token
            if verb or noun or root:
                message = "The verb of the message is {} \n".format(verb)
                message = message + "The noun of the message is {} \n".format(noun)
                message = message + "The root of the message is {} \n".format(root)
                print(Fore.LIGHTYELLOW_EX + message)
                speaker.speak(message)

        #if not(exit):
        agent.parse(command)




