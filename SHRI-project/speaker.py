import pyttsx3

class Speaker():
    def __init__(self):
        # get an engine instance or the speech synthesis
        self.engine = pyttsx3.init()
        self.engine.setProperty('rate', 125)   # default value is 200
        self.engine.setProperty('volume',0.75) # default value is 1.00, range = [0. 1]
        voices = self.engine.getProperty('voices')
        self.engine.setProperty('voice', voices[1].id)  # set the english synthesizer
        self.messages = []

    def addMessage(self, text):
        self.messages.append(text)

    def volumeUp(self, val= 0.25):
        volume = self.engine.getProperty('volume')
        self.engine.setProperty('volume', volume + 0.25)
        print("volume value: {}".format(volume))

    def volumeDown(self, val= 0.25):
        volume = self.engine.getProperty('volume')
        self.engine.setProperty('volume', volume - 0.25)
        print("volume value: {}".format(volume))

    def testVoices(self):
        voices = self.engine.getProperty('voices')
        for voice in voices:
            self.engine.setProperty('voice', voice.id)
            print("voice_id {}".format(voice.id))
            self.engine.say('The quick brown fox jumped over the lazy dog.')
        self.engine.runAndWait()

    def speak(self):
        for message in self.messages:
            message = message + ".\n"
            self.engine.say(message)
            print(message)
        self.engine.runAndWait()  #to stop use engine.stop()
