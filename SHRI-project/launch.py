from asr_listener import Listener
from speaker import  Speaker
from colorama import init, Fore, Back, Style
from agent import Agent
import spacy

EXIT_WORDS = ['bye', 'exit', 'goodbye']
# initialize colorama and set default font style after each print
init(autoreset = True)

def test_listener_speaker(listener,speaker):
    cmd = listener.listen()
    speaker.addMessage(cmd)
    speaker.speak()

if __name__ == "__main__":
    nlp = spacy.load("en_core_web_sm")
    listener = Listener()
    speaker = Speaker()
    agent = Agent("FC-21", speaker, listener)
    exit = False

    print(Back.BLUE + Fore.LIGHTBLACK_EX +  "Initializing the chatbot...")
    init_message = "Hi human, i'm an office robot, how can i help you?"
    print( Fore.LIGHTYELLOW_EX + init_message)
    speaker.speak(init_message)

    while not(exit):
        command = listener.listen()
        command = command.strip().lower()


        for word in command.split():
            if word in EXIT_WORDS:
                print(Back.BLUE+ Fore.LIGHTBLACK_EX +  "shutdown the chatbot...")
                speaker.speak("Bye bye")
                exit = True
                break

        if not(exit): agent.parse(command)

        #doc = nlp(command)
        #for token in doc:
        #    print(token.text, token.lemma_, token.pos_, token.tag_, token.dep_,
        #          token.shape_, token.is_alpha, token.is_stop)



