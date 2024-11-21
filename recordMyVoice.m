function z = recordMyVoice(Fs,nbits,nChannels)
z=audiorecorder(Fs,nbits,nChannels);
    myicon = imread('microphone.png');
    h=msgbox('Speak Up, I am Recording...','Recording','custom',myicon);
    recordblocking(z,2); %Records a 2 sec audio
    delete(h);
    
end