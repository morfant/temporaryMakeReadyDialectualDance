
// 볼륨 맥스에서 -5 확인

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



// 선반트리오 - 선시씨 나올때  go
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
~masterEQ.gui.onSelect('narration');~ha_Syn = Synth(\ha, [\amp, 4.0, \outBus, 106]);
~ha_Syn.free;




// 1. cmd + . 으로 리셋
// 2. 컴퓨터 풀볼륨 확인

(//1. eq, comp

~masterEQ.gui.onSelect('piano');
~comp_Syn = Synth(\comp, [\outBus, 0, \ths, 0.01, \clampTime, 0.00001, \amp, 0.9]);

// ~comp_Syn.set(\amp, 0.8);

)


// 3. eq piano 확인


(

//2. synths
~amp = 0.9;
~bpmScale = 65/60;

~beat_a.free;~beat_a = Synth(\dds, [\freq, 3*~bpmScale, \freqDiff, 30, \amp, ~amp, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 3000,  \nf, 1*~bpmScale, \amp2, 0.1, \outBus, 60]);
~beat_b.free;~beat_b = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp-0.4, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 2000, \nf, 1*~bpmScale, \amp2, 0.1,  \outBus, 60]);
// ~beat_c.free;~beat_c = Synth(\dds, [\freq, 2, \filFreq, 100, \susTime, 4, \amp, ~amp+0.5, \nf, 0.2, \outBus, 60]);
~beat_d.free;~beat_d = Synth(\dds, [\freq, 1*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 1*~bpmScale, \amp2, 0.1,  \outBus, 60]);
~beat_e.free;~beat_e = Synth(\dds, [\freq, 0.5*~bpmScale, \freqDiff, 18, \amp, ~amp-0.1, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 50, \nf, 2*~bpmScale, \amp2, 0.1,  \outBus, 60]);
~beat_f.free;~beat_f = Synth(\dds, [\freq, 1.5*~bpmScale, \freqDiff, 18, \amp, ~amp/4, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 6*~bpmScale, \amp2, 0.1,  \outBus, 60]);//high

// ~beat_g.free;~beat_g = Synth(\dds, [\freq, 2*~bpmScale, \freqDiff, 2, \amp, ~amp-0.1, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf,1*~bpmScale]);

)


// 3번째 루프의 반에 튼다.
~mf1_Syn = Synth(\mf1, [\amp, 0.3, \outBus, 60, \susTime, 300, \rate, ~bpmScale/2]);
~mf1_Syn.free;

// eq로 변화 주기

// 4 막판에 eq, 믹서 페이더로 고조


// 컷아웃
~comp_Syn.free;~beat_a.free;~beat_b.free;~beat_d.free;~beat_e.free;~beat_f.free;~mf1_Syn.free;





// cmd + . 으로 컷아웃


/* ------------------------------------------------------------------------------------------------------------------------------------------------------ */
