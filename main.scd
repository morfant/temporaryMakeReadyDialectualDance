
// 볼륨 맥스에서 -5

// narration
//1. 시작 후 30초 세고 튼다.
~masterEQ.gui.onSelect('narration');~na1_Syn = Synth(\na1, [\amp, 1.6, \outBus, 106]);
//"새남자들을 맞았다" 후 30초 지난 후 볼륨 줄임. (몇 초?    1: 32초에 줄인다)
~na1_Syn.free;


(
// 오르간소리
// mel
~m1.stop;~m2.stop;
// ~masterEQ.gui.onSelect('x_flat');
~slid_0.value_(0);~mixer.set(\amp_0, 0);
~slid_1.value_(0);~mixer.set(\amp_1, 0);
~m1 = ~pb_mel_1.play;
~m2 = ~pb_mel_2.play; // to low
);


// 대야씬 음악 go, 오르간 페이드아웃
~buc = ~pb_bucket.play; //EQ? - 볼륨 크게
~m1.stop;~m2.stop;


//의자씬
~chair = ~pb_chair.play;// ~masterEQ.gui.onSelect('wing');


 // 셋 등장시 빠르게
~buc.stop;~buc_fast = ~pb_bucket_fast.play;


//침대옷장
(// 대야가 나가면 주성씨 나온다.

~buc.stop;
~buc_fast.stop;// 대야씬 아웃
~chair.stop;// 의자씬 아웃

~masterEQ.gui.onSelect('synth');
~bed = ~pb_bed.play;
)


//침대옷장 아웃, 메트리스 첫번째 칠 때 out. 2초후 나레이션.
~bed.stop;


//2. 메트리스 첫 번째 엎고, 2초 후에 실행
~masterEQ.gui.onSelect('narration');~na2_Syn = Synth(\na2, [\amp, 1.6,  \outBus, 106]);
~na2_Syn.free;



// 브릿지
// 메트리스를 침대에 팍 엎는 순간 go -  볼륨 업
~bridge = ~pb_bridge.play;



// Bass
// 정아씨, 혜림씨 서면 브릿지 끝나는 박자에 맞춰서
(

~bridge.stop;

~bass_default_amp = 0.6;
~mixer.set(\amp_2, ~scale*~bass_default_amp);

// sync
~num_2.value_(~scale*~bass_default_amp.round(0.01));
~slid_2.value_(~bass_default_amp);
~mixer.set(\amp_2, ~bass_default_amp*~scale);

~masterEQ.gui.onSelect('nb');~dum_slow = ~pb_dum_slow.play;

)



// 선반트리오 - 선시씨 나와서 정아씨 옆에 서면 go
(
~pb_mf2_piano_2.stop;
~default_amp = 0.5;
~dum_slow.stop;~pb_dum_slow_2.stop;
~masterEQ.gui.onSelect('noise');

// sync
~num_2.value_(~scale*~default_amp.round(0.01));
~slid_2.value_(~default_amp);
~mixer.set(\amp_2, ~default_amp*~scale);

~shelf.stop;~shelf = ~pb_shelf.play;
)


// 선시씨 물구나무서기 내려오는 것에 맞추어 CH3 으로 fade out
~shelf.stop;




// 무선 청소기 등장



// 고조를 위한 함수
(
~reset_rate = {|r, r2, v, v2|

~pb_wm_1.stream = Pbind(
	\instrument, \mf2,
	\rate, r,
	\susTime, 1.0,
	\start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]*1.2+v, inf)
).asStream;

~pb_tal.stream = Pbind(
	\instrument, \mf1,
	\rate, r2,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.53+v2
).asStream;

}
)


// 주성씨 세탁기에서 내려와서 바닥에 닿으면 - Ting
(
fork{
	1.do{
		Synth(\ting, [\freq, 1700, \hfFreq, 1400, \amp, 0.6]);
		Synth(\ting, [\freq, 1698, \hfFreq, 1400, \amp, 0.6]);

		0.7.wait;


		{~masterEQ.gui.onSelect('tal');}.defer;

		// 태이씨 세탁기에서 나오면
		~wm_1 = ~pb_wm_1 = Pbind(
			\instrument, \mf2,
			\rate, 1,
			\susTime, 1.0,
			\start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
			\amp, Pseq([0.8, 0.8, 0.6, 0.6]*1.2, inf)
		).play;

		7.2.wait;


		// 태이씨 바닥에서 춤추기 시작하면
		~r = 2.8;
		~pb_tal = Pbind(
			\instrument, \mf1,
			\rate, 1*~r,
			\susTime, 2.7*2,
			\dur, 2.68*2,
			\start, s.sampleRate*68,
			\amp, 0.53
		).play;
	}
}

);



// 고조 실행
(
fork{
	30.do{| i |
		(i/10).postln;
		{ ~reset_rate.value(1.0 + (i/10), 2.8 + (i/10), (i/40), (i/40) )}.defer;
		2.6*2.wait;
	}
}
)

// 민하씨가 커튼 뺏을 때, cmd + . 으로 컷아웃 - 완전히 떨어질 때!



// 김광석 노래
// 서른즈음에 (2절 '점점더~' 부터)
//1. 페이드 인
~masterEQ.gui.onSelect('x_flat');~kim_song = Synth(\kim, [\amp, 0.5, \atTime, 20, \relTime, 10, \gate, 1]);

// 2. 페이드아웃
~kim_song.release(8); // 스피커 나오기 시작하면 go


// 테스트용
~kim_song.release(1);


// 김광석 노래 페이드아웃 중에,
//나레이션 3. 스피커 in, 무대 중간 밟을때, 나온다.
~masterEQ.gui.onSelect('narration');~na3_Syn = Synth(\na3, [\amp, 2.0, \outBus, 106]);
~na3_Syn.free;


// '하' 파일 예비로 실행할 수 있게 준
~masterEQ.gui.onSelect('narration');~ha_Syn = Synth(\ha, [\amp, 3.0, \outBus, 106]);
~ha_Syn.free;




// cmd + . 으로 리셋 한번 한다!!!!
// Ending - 처음부터 갑자기 커야 한다
// 컴퓨터 풀볼륨으로 시작
 // BPM은 65
// eq piano 되어 있는지 확인!!!!

(//1. eq, comp

~masterEQ.gui.onSelect('piano');
~comp_Syn = Synth(\comp, [\outBus, 0, \ths, 0.01, \clampTime, 0.00001, \amp, 0.7]);

// ~comp_Syn.set(\amp, 0.8);
)



// 베이스음의 성질 - 왜 안 커지는지
// 컴프
// eq로 고조
// 볼륨도 고조


(
//2. synths - 녹음해 버리자!

// Ending - 시작부터 갑자기 커야 한다:
~amp = 0.6;
~bpmScale = 65/60;

~beat_a.free;~beat_a = Synth(\dds, [\freq, 3*~bpmScale, \freqDiff, 30, \amp, ~amp, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 3000,  \nf, 1*~bpmScale, \outBus, 60]);
~beat_b.free;~beat_b = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 1*~bpmScale, \outBus, 60]);
// ~beat_c.free;~beat_c = Synth(\dds, [\freq, 2, \filFreq, 100, \susTime, 4, \amp, ~amp+0.5, \nf, 0.2, \outBus, 60]);
~beat_d.free;~beat_d = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 1*~bpmScale, \outBus, 60]);
~beat_e.free;~beat_e = Synth(\dds, [\freq, 0.5*~bpmScale, \freqDiff, 18, \amp, ~amp-0.1, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 50, \nf, 2*~bpmScale, \outBus, 60]);
~beat_f.free;~beat_f = Synth(\dds, [\freq, 1.5*~bpmScale, \freqDiff, 18, \amp, ~amp/4, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 6*~bpmScale, \outBus, 60]);//high




// ~beat_g.free;~beat_g = Synth(\dds, [\freq, 2*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf,1*~bpmScale]);

)


// 3번째 루프의 반에 튼다.
~mf1_Syn = Synth(\mf1, [\amp, 0.4, \outBus, 60, \susTime, 300, \rate, ~bpmScale/2]);
~mf1_Syn.free;


// cmd + . 으로 컷아웃


/* ------------------------------------------------------------------------------------------------------------------------------------------------------ */


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
	// \rate, Pseq([1, 1, 1, 1, 1, 1.2, 1, 3, 1, 0.8], inf),
	\rate, Pseq([1, 1, 1,  1, 1, 0.8, 2, 2.1, 1.5]*2.2, inf),
	// \rate, Pseq([1, 1, 1, 1.8, 1.0], inf),
	// \susTime, 0.06,
	\susTime, 1.4,
	// \atTime, Pseq([0.1, 0.1, 0.2, 0.15, 0.4]/2, inf),
	\atTime, Pseq([0.9], inf),
	\relTime, 0.01,
	// \dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3, 1, 0.7, 2/3, 2/3+0.2]*(7/6)*0.4, inf),
	\dur, Pseq([2/3+0.3, 1, 0.7, 0.7, 0.5, 0.4, 0.1, 1, 0.3 ]*(7/6)*0.3*2, inf),
	// \start, s.sampleRate*231,
	// \start, s.sampleRate*331,	// trum
	// \start, s.sampleRate*382,	// trum
	\start, s.sampleRate*382,	// trum
	\amp, 0.005
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

asdfasd
(// piano
// ~masterEQ.gui.onSelect('piano');

~pb_mf2_piano_2.stream = Pbind(
	// ~pb_mf2_piano_2 = Pbind(
	\instrument, \mf2,
	// \rate, 1,
	// \rate, Pseq([1, 1, 1, 1, 1, 2, 9, 4, 1, 0.8], inf),
	// \rate, Pseq([1, 1, 1, 1, 1, 0.8, 1.3, 1.5, 1.3, 1.6]/2, inf),
	\rate, Pseq([14, 18, 10, 8]/2, inf),
	// \rate, Pseq([1, 1, 1, 1.8, 1.0], inf),
	// \susTime, 0.06,
	\susTime, 0.6,
	// \atTime, Pseq([0.1, 0.1, 0.2, 0.15, 0.4]/2, inf),
	\atTime, Pseq([0.1]*3, inf),
	\relTime, 0.01,
	// \dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3, 1, 0.7, 2/3, 2/3+0.2]*(7/6)*0.4, inf),
	\dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2]*(7/6)*0.4, inf),
	// \start, s.sampleRate*231,
	// \start, s.sampleRate*331,	// trum
	\start, s.sampleRate*382,	// trum
	\amp, 0.05
	).asStream;
// ).play;
)

~pb_mf2_piano_2.play;




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



