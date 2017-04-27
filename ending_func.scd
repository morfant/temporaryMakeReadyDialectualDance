

(

~comp_func = {

~masterEQ.gui.onSelect('piano');
~comp_Syn = Synth(\comp, [\outBus, 0, \ths, 0.01, \clampTime, 0.00001, \amp, 0.9]);

};




~go_ending = {
// 베이스음의 성질 - 왜 안 커지는지
// 컴프
// eq로 고조
// 볼륨도 고조



//2. synths - 녹음해 버리자!

// Ending - 시작부터 갑자기 커야 한다:
~amp = 0.9;
~bpmScale = 65/60;

~beat_a.free;~beat_a = Synth(\dds, [\freq, 3*~bpmScale, \freqDiff, 30, \amp, ~amp, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 3000,  \nf, 1*~bpmScale, \amp2, 0.1, \outBus, 60]);
~beat_b.free;~beat_b = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp-0.4, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 2000, \nf, 1*~bpmScale, \amp2, 0.1,  \outBus, 60]);
// ~beat_c.free;~beat_c = Synth(\dds, [\freq, 2, \filFreq, 100, \susTime, 4, \amp, ~amp+0.5, \nf, 0.2, \outBus, 60]);
~beat_d.free;~beat_d = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 1*~bpmScale, \amp2, 0.1,  \outBus, 60]);
~beat_e.free;~beat_e = Synth(\dds, [\freq, 0.5*~bpmScale, \freqDiff, 18, \amp, ~amp-0.1, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 50, \nf, 2*~bpmScale, \amp2, 0.1,  \outBus, 60]);
~beat_f.free;~beat_f = Synth(\dds, [\freq, 1.5*~bpmScale, \freqDiff, 18, \amp, ~amp/4, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 6*~bpmScale, \amp2, 0.1,  \outBus, 60]);//high




// ~beat_g.free;~beat_g = Synth(\dds, [\freq, 2*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf,1*~bpmScale]);

}
)

~comp_func.value;
~go_ending.value;