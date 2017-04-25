

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


// 볼륨 맥스에서 -5

// narration
//1. 시작 후 30초 세고 튼다.
// ~masterEQ.gui.onSelect('narration');
~na1_Syn = Synth(\na1, [\amp, 1.0, \outBus, 106]);
//"새남자들을 맞았다" 후 30초 지난 후 볼륨 줄임.
// ~masterEQ.gui.onSelect('narration');~na1_Syn = Synth(\na1, [\amp, 1.0, \outBus, 0]);
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


// 오르간 끄고, 대야씬 음악 go
~m1.stop;~m2.stop;~buc = ~pb_bucket.play; //EQ?
~buc.stop;~buc_fast = ~pb_bucket_fast.play; // 셋 등장시 빠르게



//의자씬
(
~chair = ~pb_chair.play;// ~masterEQ.gui.onSelect('wing');
)


// 대야씬 아웃
~buc_fast.stop;



//침대옷장
(
~chair.stop;
~masterEQ.gui.onSelect('synth');
~bed = ~pb_bed.play;
)

//침대옷장 아웃
~bed.stop;


//2. 메트리스 in
~masterEQ.gui.onSelect('narration');~na2_Syn = Synth(\na2, [\amp, 1.0,  \outBus, 106]);
~na2_Syn.free;



// Bass
// 메트리스를 침대에 엎는 순간 go
(
~mixer.set(\amp_2, 2.2);
~masterEQ.gui.onSelect('nb');~dum_slow = ~pb_dum_slow.play;
)

// 자진모리 변형

~c.stop;
~c.stop;~b = ~pb_dum_fast.play;
~b.stop;~a = ~pb_dum_basic.play;
~a.stop;~b = ~pb_dum_fast.play;
~b.stop;~c = ~pb_dum_slow.play;



// 선반트리오
(
~dum_slow.stop;
~masterEQ.gui.onSelect('noise');
~shelf = ~pb_shelf.play;
)

// 선시씨 물구나무서기 내려오는 것에 맞추어 CH3 으로 fade out
~shelf.stop;



// 주성씨 세탁기에서 내려와서 바닥에 닿으면 - Ting
(
Synth(\ting, [\freq, 1700, \hfFreq, 1400, \amp, 0.4]);
Synth(\ting, [\freq, 1690, \hfFreq, 1400, \amp, 0.4]);
)


// 고조를 위한 함수
(
~reset_rate = {|r, r2|

~pb_wm_1.stream = Pbind(
	\instrument, \mf2,
	\rate, r,
	\susTime, 1.0,
	\start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]/10, inf)
).asStream;

~pb_tal.stream = Pbind(
	\instrument, \mf1,
	\rate, r2,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.05
).asStream;

}
)

// 태이씨 세탁기에서 나오면
(
~masterEQ.gui.onSelect('tal');

~wm_1 = ~pb_wm_1 = Pbind(
	\instrument, \mf2,
	\rate, 1,
	\susTime, 1.0,
	\start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]/10, inf)
).play;
);


// 태이씨 바닥에서 춤추기 시작하면
(
~r = 2.8;
~pb_tal = Pbind(
	\instrument, \mf1,
	\rate, 1*~r,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.05
	).play;
)


// 고조 실행
(
fork{
	20.do{| i |
		(i/10).postln;
		{ ~reset_rate.value(1.0 + (i/10), 2.8 + (i/10)) }.defer;
		2.6*2.wait;
	}
}
)

// 민하씨가 커튼 뺏을 때, cmd + . 으로 컷아웃



// 김광석 노래
// 서른즈음에 (2절 '점점더~' 부터)
//1. 페이드 인
~masterEQ.gui.onSelect('x_flat');~kim_song = Synth(\kim, [\amp, 0.4, \atTime, 20, \relTime, 10, \gate, 1]);

// 2. 페이드아웃
~kim_song.release(14);


// 테스트용
~kim_song.release(1);



//나레이션 3. 스피커 in
~masterEQ.gui.onSelect('narration');~na3_Syn = Synth(\na3, [\amp, 0.8, \outBus, 106]);
~na3_Syn.free;


// '하' 파일 예비로 실행할 수 있게 준



// Ending - 처음부터 갑자기 커야 한다
// 컴퓨터 풀볼륨으로 시작
 // BPM은 65
//컴프 걸 수 있게 할 것

~comp_Syn = Synth(\comp, [\outBus, 0, \clampTime, 0.001]);

(
// Ending - 시작부터 갑자기 커야 한다
~amp = 0.5;
~bpmScale = 65/60;
// ~masterEQ.gui.onSelect('ending');
a.free;a = Synth(\dds, [\nf, 0.2, \freq, 2, \filFreq, 100, \susTime, 4, \amp, ~amp]);
// a.set(\nf, 2, \freq, 2, \filFreq, 100, \susTime, 1);

a.free;a = Synth(\dds, [\freq, 3*~bpmScale, \freqDiff, 30, \amp, ~amp, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 3000,  \nf, 1*~bpmScale]);
b.free;b = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 1*~bpmScale]);
// b.free;
c.free;c = Synth(\dds, [\freq, 0.5*~bpmScale, \freqDiff, 18, \amp, ~amp-0.1, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 50, \nf, 2*~bpmScale]);
// c.free;
d.free;d = Synth(\dds, [\freq, 1.5*~bpmScale, \freqDiff, 18, \amp, ~amp/4, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 6*~bpmScale]);
// e.free;e = Synth(\dds, [\freq, 2*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf,1*~bpmScale]);

// d.free;

// ~mf2_Syn = Synth(\mf2, [\amp, 0.4, \outBus, 0, \susTime, 39, \rate, ~bpmScale/4]);
~mf1_Syn = Synth(\mf1, [\amp, 0.4, \outBus, 0, \susTime, 300, \rate, ~bpmScale/2]);


// ~pb_mf2_synthBass.play;
// ~pb_mf2_piano_2.play;

)





~pb_dum.stop;
// Dum
(
~pb_dum.stream = Pbind(
	\instrument, \dum,
	\freq, 1700,
	\dens, 5,
	\amp, 0.5,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf),
	\hfFreq, 60
).asStream;
)


(
~pb_dum.stream = Pbind(
	\instrument, \dum,
	\freq, 90,
	\dens, 1,
	\amp, 1.4,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf)
).asStream;
)


(
~pb_dum.stream = Pbind(
	\instrument, \dum,
	\freq, 100,
	\dens, 2,
	\amp, 1.8,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5]/4, inf)
).asStream;
)

~pb_dum.stop;


(
~pb_dum.stream = Pbind(
	\instrument, \dum,
	\freq, 90/3,
	\dens, 1,
	\amp, 1.4,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 0.5], inf)
).asStream;
)


~pb_dum.stop;



//태이씨 세탁기

(//락킹 - 좀더 크게
~masterEQ.gui.onSelect('rocking');
~pb_rocking = Pbind.new(
	\instrument, \jabNoise,
	\amp, 1.0,
	\dur, Pseq([Pseq([0.1], rrand(7, 15)), 0.2], inf),
	// \freq, Pseq([Pseq([rrand(20, 30)], 5), 200, Pseq([20], 10), 110, Pseq([20], 3), 100], inf),
	// \freq, Pseq([Pseq([rrand(20, 30)]*3, 5), 200, Pseq([20]*2, 10), 110, Pseq([20]*4, 3), 100]*1.4, inf),
	\freq, Pseq([Pseq([rrand(20, 30)]*3, 5), 200, Pseq([20]*2, 10), 110, Pseq([20]*4, 3), 100]*2.9, inf),
	\rate, Prand([10, 6, 4, 7, 9], inf),
	\atTime, Pseq([0.05, 0.05, Prand([0.05, 0.1, 0.02, 0.3], 1), 0.05, 0.05, 0.05, Prand([0.05, 0.01, 0.02, 0.03], 1)], inf),
	\relTime, 0.025,
	\outAmp, 1.0
).play;

~pb_mf2_b.play;
)


~pb_mf2_b.stop;~pb_rocking.stop;




~pb_rocking.stop;~m2.stop;~m1.stop;~pb_mf2_b.stop;~pb_rocking.stop;



~mf1_Syn = Synth(\mf1, [\amp, 1.0, \rate, 1, \susTime, 2.8]);

(
// ~pb_mf1 = Pbind(
	~pb_mf1.stream = Pbind(
	\instrument, \mf1,
	\rate, 1*0.5,
	\susTime, 2.68*10,
	\dur, 2.68*10,
	\start, 0,
	\amp, 0.5
// ).play;
).asStream;

)


~pb_mf1.play;


(// ddan - 선반?
~masterEQ.gui.onSelect('ddan');
~r = 0.8;
~pb_mf1 = Pbind(
	// ~pb_mf1.stream = Pbind(
	\instrument, \mf1,
	\rate, 1*~r,
	\susTime, 2.68*2,
	\dur, 2.68*2,
	\start, s.sampleRate*120,
	\amp, 0.07
// ).asStream;
).play;
)

~pb_mf1.stop;
~pb_mf3.play;

(
a = 1.1;
// ~pb_wm_1 = Pbind(
~pb_wm_1.stream = Pbind(
	\instrument, \mf2,
	\rate, 1*2,
	\susTime, 1.0,
	\start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	// \start, Pseq([40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]/10, inf)
// ).play;
).asStream;
);


(// tal
~masterEQ.gui.onSelect('tal');
~r = 3.0;
~pb_mf3.stream = Pbind(
	// ~pb_mf3 = Pbind(
	\instrument, \mf1,
	\rate, 1*~r,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.1
	).asStream;
// ).play;
)





(// tal
~masterEQ.gui.onSelect('tal');
~r = 3.6;
~pb_mf3.stream = Pbind(
	// ~pb_mf3 = Pbind(
	\instrument, \mf1,
	\rate, 1*~r,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.1
	).asStream;
// ).play;
)




(// tal2
~masterEQ.gui.onSelect('tal');
~r = 1;
// ~pb_mf1.stream = Pbind(
~pb_mf3 = Pbind(
	\instrument, \mf1,
	\rate, 1*~r,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.1
// ).asStream;
).play;
)


~pb_mf3.stop;
~pb_mf3.play;

~mf2_Syn = Synth(\mf2, [\amp, 1.0, \rate, 1, \susTime, 30]); //세탁기?

~pb_mf1.play;
~pb_mf1.stop;


~mf2_Syn = Synth(\mf2, [\amp, 1.0, \rate, 1, \susTime, 30]); //세탁기?

~mf2_Syn = Synth(\mf2, [\amp, 1.0, \rate, 1, \start, s.sampleRate*400, \susTime, 1.0]);
~mf2_Syn.free;




~pb_mf1.play;
~pb_mf2_b.play;
~pb_mf2_b.stop;

띵,
부르르르,

( // 세탁기 + 변칙적인 긴 호흡

~pb_mf2 = Pbind(
	\instrument, \mf2,
	\rate, 1,
	\susTime, 1.0,
	// \start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	\start, Pseq([40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]/10, inf)
).play;

)

~pb_mf2.stop;~pb_mf1.stop;

(// ending+
// ~pb_mf2.stream = Pbind(
~pb_mf2 = Pbind(
	\instrument, \mf2,
	\rate, Pseq([1, 3, Prand([0.2, 0.3, 0.4], 1), 5], inf),
	\susTime, Pseq([1.0, 3.0, 0.3, 0.6], inf),
	\dur, Pseq([1.0, 3.0, 0.3, 0.6], inf),
	\start, Pseq([100, 20, 200, 40]*s.sampleRate, inf),
	\amp, Pseq([0.6, 0.6, 0.3, 0.4]/4, inf)
	// ).asStream;
).play;
)


~pb_mf2.play;

~pb_mf2.stop;


(// 침대옷장?
~pb_mf2_b = Pbind(
	\instrument, \mf2,
	\rate, 1,
	\susTime, 0.2,
	\dur, 0.2,
	\start, Pseq([10, 20, 30, 20, 90, 120, 70, 5]*s.sampleRate, inf),
	\amp, Pseq([0.5, 0.5, 0.6, 0.4, 0.1], inf)
).play;

)


~pb_mf2_b.stop;


(// 대야씬
~pb_mf2_b.stream = Pbind(
	// ~pb_mf2_b = Pbind(
	\instrument, \mf2,
	\rate, Pseq([

		1, 0.5, -2, 5, 1, 1, 0.2, 0.9

	]*2*(-1), inf),
	\susTime, 0.05,
	// \dur, 0.6, // 처음 - 느리게
	\dur, 0.5, // 셋이 될 때 - 좀 더 빠르게
	\start, Pseq([

		10, 200, 30, 20, 280, 120, 70, 5,
		10, 20, 30, 20, 90, 280, 70, 5,
		10, 120, 230, 320, 90, 280, 70, 5

	]*s.sampleRate, inf),
	\amp, Pseq([0.5, 0.5, 0.6, 0.4, 0.1, 0.4, 0.4]*0.3, inf)
	).asStream;
// ).play;
)

~pb_mf2_b.stop;
~pb_mf2_b.play;



(
~pb_mf1 = Pbind(
	\instrument, \mf1,
	\rate, 1,
	\susTime, 0.2,
	\dur, 0.2,
	\start, Pseq([10, 20, 30, 20, 90, 120, 70, 5]*s.sampleRate, inf),
	\amp, Pseq([0.5, 0.5, 0.6, 0.4, 0.1]/2, inf)
).play;

)



~pb_mf1.stop;







32 * 4

128 * (60/65) = 118초. 약 120초




a.free;b.free;c.free;d.free;e.free;f.free;g.free;~mf1_Syn.free;~mf2_Syn.free;~comp_Syn.free;

~mf2_Syn.free;
~mf1_Syn.set(\amp, 0.1);
~pb_mf2_piano_2.stop;


(// piano_ending?
~masterEQ.gui.onSelect('piano');

~pb_mf2_piano_2.stream = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	// \rate, Pseq([1, 1, 1, 1, 1, 2, 9, 4, 1, 0.8], inf),
	\rate, Pseq([1, 1, 1,  1, 1, 0.8]*2.2, inf),
	// \rate, Pseq([1, 1, 1, 1.8, 1.0], inf),
	// \susTime, 0.06,
	\susTime, 1.4,
	// \atTime, Pseq([0.1, 0.1, 0.2, 0.15, 0.4]/2, inf),
	\atTime, Pseq([0.9], inf),
	\relTime, 0.01,
	// \dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3, 1, 0.7, 2/3, 2/3+0.2]*(7/6)*0.4, inf),
	\dur, Pseq([2/3+0.3, 1, 0.7, 0.7, 0.5, 0.4, 0.1, 1 ]*(7/6)*0.3*2, inf),
	// \start, s.sampleRate*231,
	// \start, s.sampleRate*331,	// trum
	// \start, s.sampleRate*382,	// trum
	\start, s.sampleRate*382,	// trum
	\amp, 0.1
).asStream;
)



~pb_mf2_piano_2.play;
~pb_mf2_piano_2.stop;

~mf1_Syn.free;


~mf2_Syn.free;


~mf1_Syn.set(\amp, 0.5);
~mf2_Syn.set(\amp, 1.0);

~pb_mf2_synthBass.stop;
~mf1_Syn = Synth(\mf1, [\amp, 1.2, \outBus, 80, \rate, 1.2]);

a.free;b.free;c.free;d.free;e.free;f.free;g.free;~mf1_Syn.free;~mf2_Syn.free;~comp_Syn.free;
~comp_Syn.set(\ths, 0.1, \clampTime, 0.001, \amp, 0.3);
~mf1_Syn.set(\amp, 1.2);

(
~ff = 16;
a.set(\freq, ~ff*~bpmScale);
b.set(\freq, ~ff*~bpmScale);
c.set(\freq, ~ff*~bpmScale);
d.set(\freq, ~ff*~bpmScale);
)


a.set(\freq, 30*~bpmScale);



~mf2_Syn = Synth(\mf2, [\amp, 0.3, \rate, 1, \susTime, 0.1, \start, s.sampleRate*231]); //Synth bass
~mf2_Syn = Synth(\mf2, [\amp, 0.3, \rate, 1, \susTime, 0.1, \start, s.sampleRate*331]); //trum

(
~pb_mf2_synthBass = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	\rate, Pseq([1, 1, 1, 3, 3], inf),
	\susTime, 0.2,
	\dur, Pseq([2/3+0.5, 1, 0.5, 2/3, 2/3]*7/6/2, inf),
	\start, s.sampleRate*231,
	\amp, 0.2
).play;

)


~pb_mf2_synthBass.stop;

(// trum - 대대옷장
~masterEQ.gui.onSelect('synth');
~pb_mf2_synthBass.stream = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	// \rate, Pseq([1, 1, 1, 1, 1, 2, 9, 4, 1, 0.8], inf),
	// \rate, Pseq([1, 1, 1, 1, 1, 0.8], inf),
	\rate, Pseq([1, 1, 1, 1.8, 1.0], inf),
	// \susTime, 0.06,
	\susTime, 0.6,
	// \atTime, Pseq([0.1, 0.1, 0.2, 0.15, 0.4]/2, inf),
	\atTime, Pseq([0.1]/2, inf),
	\relTime, 0.01,
	// \dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3, 1, 0.7, 2/3, 2/3+0.2]*(7/6)*0.4, inf),
	\dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3]*(7/6)*0.4, inf),
	// \start, s.sampleRate*231,
	\start, s.sampleRate*331,	// trum
	\amp, 0.2
).asStream;
)

~pb_mf2_synthBass.play;
~pb_mf2_synthBass.stop;


(// piano
~masterEQ.gui.onSelect('piano');

~pb_mf2_piano_2.stream = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	// \rate, Pseq([1, 1, 1, 1, 1, 2, 9, 4, 1, 0.8], inf),
	\rate, Pseq([1, 1, 1, 1, 1, 0.8, 1.3, 1.5, 1.3, 1.6]/2, inf),
	// \rate, Pseq([1, 1, 1, 1.8, 1.0], inf),
	// \susTime, 0.06,
	\susTime, 0.6,
	// \atTime, Pseq([0.1, 0.1, 0.2, 0.15, 0.4]/2, inf),
	\atTime, Pseq([0.1]/2, inf),
	\relTime, 0.01,
	// \dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3, 1, 0.7, 2/3, 2/3+0.2]*(7/6)*0.4, inf),
	\dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3, 1, 1, 0.7, 0.8]*(7/6)*0.4, inf),
	// \start, s.sampleRate*231,
	// \start, s.sampleRate*331,	// trum
	\start, s.sampleRate*382,	// trum
	\amp, 0.2
).asStream;
)





(// piano_2
~masterEQ.gui.onSelect('piano');

~pb_mf2_piano_2 = Pbind(
	// ~pb_mf2_piano_2.stream = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	\rate, Pseq([1, 1, 1, 1, 1, 0.8, 1.3, 1.5, 1.3, 1.6, 1, 1, 1, 1, 1, 1.2, 1, 1, 1, 1, 1, 1.8, 1, 1, 1, 1, 1, 1.2, 1, 1, 1, 1, 1, 1.8]/2, inf),
	\susTime, 0.6,
	\atTime, Pseq([0.1]/2, inf),
	\relTime, 0.01,
	\dur, Pseq([

		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		1, 1, 0.7, 0.8,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3

	]*(7/6)*0.4, inf),
	\start, s.sampleRate*382,	// piano
	\amp, 0.2
	).play;
// ).asStream;
)

~pb_mf2_piano_2.play;

(// noise beat - 반반?
~masterEQ.gui.onSelect('noise');

~pb_mf2_piano_2 = Pbind(
	// ~pb_mf2_piano_2.stream = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	\rate, Pseq([1, 1, 1, 1, 1, 0.8, 1, 1, 1, 1, 1, 1.2, 1, 1, 1, 1, 1, 1.4, 1, 1, 1, 1, 1, 1.2, 1, 1, 1, 1, 1, 1.6]/2, inf),
	\susTime, 0.6,
	\atTime, Pseq([0.1]/2, inf),
	\relTime, 0.01,
	\dur, Pseq([

		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		// 1, 1, 0.7, 0.8,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3

	]*(7/6)*0.4, inf),
	// \start, s.sampleRate*420, // dist noise
	\start, s.sampleRate*410, // dist noise
	\amp, 0.2
	).play;
// ).asStream;
)

~pb_mf2_piano_2.stop;



~pb_mf2_b.play;
~pb_mf2_b.stop;



(// wing - 의자
~masterEQ.gui.onSelect('wing');

 ~pb_mf2_wing = Pbind(
// ~pb_mf2_wing.stream = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	\rate, Pseq([1.8, 1.2, 1.8, 1.2, 1.8, 0.8]*4, inf),
	\susTime, 0.6*4,
	\atTime, Pseq([0.1]/2*4, inf),
	\relTime, 0.01,
	\dur, Pseq([

		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		// 1, 1, 0.7, 0.8,
		// 2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		// 2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		// 2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		// 2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3

	]*(7/6)*2, inf),
	\start, s.sampleRate*120, // dist noise
	\amp, Pseq([0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05]/10, inf) // 더 작게
	).play;
// ).asStream;
)


~pb_mf2_b.stop;~pb_mf2_piano_2.play;

~pb_mf2_piano_2.stop;
~pb_mf2_wing.stop;



~pb_mf2_piano_2 = .play;
~pb_mf2_piano_2.stop;


~pb_mf2_synthBass.play;



~pb_mf2_synthBass.play;
~pb_mf2_synthBass.stop;






1:x = 60:70

60x = 70

x = 7/6



