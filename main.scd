

// //Q: 정아씨 대야에 머리 박으면
// ~naration_32 = Synth(\tt, [\amp, 0.24]);
// ~naration_32.free;
//
// //Q: 선시씨 옷장들고 충분히 등장하면
// ~naration_book = Synth(\book, [\amp, 0.24]);
// ~naration_book.free;
//
// //Q: 주성씨가 탄 욕조가 무대에 나오면
// ~naration_forMe = Synth(\for, [\amp, 0.18]);
// ~naration_forMe.free;


// narration
//1. 시작 후 30초 세고 튼다.
~masterEQ.gui.onSelect('narration');~na1_Syn = Synth(\na1, [\amp, 1.0, \outBus, 106]);
~na1_Syn.free;


(
// 오르간소리
// mel
~m1.stop;~m2.stop;
~masterEQ.gui.onSelect('x_flat');
~slid_0.value_(0);~mixer.set(\amp_0, 0);
~slid_1.value_(0);~mixer.set(\amp_1, 0);
~m1 = ~pb_mel_1.play;
~m2 = ~pb_mel_2.play; // to low
);

~m1.stop;~m2.stop;




//2. 메트리스 in
// ~t.stop;~a.stop;
~masterEQ.gui.onSelect('narration');~na2_Syn = Synth(\na2, [\amp, 1.0,  \outBus, 106]);
~na2_Syn.free;



// Bass
// 선풍기 바람 맞을 때 페이드인
~masterEQ.gui.onSelect('nb');~c = ~pb_dum_slow.play;
~c.stop;~b = ~pb_dum_fast.play;
~b.stop;~a = ~pb_dum_normal.play;

~a.stop;~b.stop;~c.stop;



//태이씨 세탁기

(//락킹
~masterEQ.gui.onSelect('rocking');
~pb_rocking = Pbind.new(
	\instrument, \jabNoise,
	\amp, 0.8,
	\dur, Pseq([Pseq([0.1], rrand(7, 15)), 0.2], inf),
	// \freq, Pseq([Pseq([rrand(20, 30)], 5), 200, Pseq([20], 10), 110, Pseq([20], 3), 100], inf),
	// \freq, Pseq([Pseq([rrand(20, 30)]*3, 5), 200, Pseq([20]*2, 10), 110, Pseq([20]*4, 3), 100]*1.4, inf),
	\freq, Pseq([Pseq([rrand(20, 30)]*3, 5), 200, Pseq([20]*2, 10), 110, Pseq([20]*4, 3), 100]*2.9, inf),
	\rate, Prand([10, 6, 4, 7, 9], inf),
	\atTime, Pseq([0.05, 0.05, Prand([0.05, 0.1, 0.02, 0.3], 1), 0.05, 0.05, 0.05, Prand([0.05, 0.01, 0.02, 0.03], 1)], inf),
	\relTime, 0.025,
	\outAmp, 1.0
).play;
)

~pb_rocking.stop;~m2.stop;



// 김광석 노래
// 서른즈음에 (2절 '점점더~' 부터)
//1. 페이드 인
~masterEQ.gui.onSelect('x_flat');~kim_song = Synth(\kim, [\amp, 0.3, \atTime, 20, \relTime, 10, \gate, 1]);

// 2. 페이드아웃
~kim_song.release(14);



//나레이션 3. 스피커 in
~masterEQ.gui.onSelect('narration');~na3_Syn = Synth(\na3, [\amp, 1.0, \outBus, 106]);
~na3_Syn.free;



(
// Ending - 시작부터 갑자기 커야 한다
~amp = 0.6;
~masterEQ.gui.onSelect('ending');
a.free;a = Synth(\dds, [\nf, 0.2, \freq, 2, \filFreq, 100, \susTime, 4, \amp, ~amp]);
// a.set(\nf, 2, \freq, 2, \filFreq, 100, \susTime, 1);

a.free;a = Synth(\dds, [\freq, 3, \freqDiff, 30, \amp, ~amp, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 3000,  \nf, 1]);
b.free;b = Synth(\dds, [\freq, 1, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 1]);
// b.free;
c.free;c = Synth(\dds, [\freq, 0.5, \freqDiff, 18, \amp, ~amp-0.1, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 50, \nf, 2]);
// c.free;
d.free;d = Synth(\dds, [\freq, 1.5, \freqDiff, 18, \amp, ~amp/4, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 6]);
// d.free;
e.free;e =  Synth(\dds2, [\freq, 1.5, \freqDiff, 3, \amp, ~amp, \amp2, 0.1, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 3]);
)

a.free;b.free;c.free;d.free;e.free;
// 현상 유지 시키려면?




