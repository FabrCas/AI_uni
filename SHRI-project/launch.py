from asr_listener import Listener
from speaker import  Speaker

def test_listener_speaker(listener,speaker):
    cmd = listener.listen()
    speaker.addMessage(cmd)
    speaker.speak()

if __name__ == "__main__":
    listener = Listener()
    speaker = Speaker()
   # speaker.testVoices()
    test_listener_speaker(listener,speaker)
