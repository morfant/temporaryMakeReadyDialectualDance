(
SynthDef.new(\tak, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, atTime = 0.3, relTime = 0.4;
	var env, sig, sig1, sig2, sig3, sig4, sig5, sigG, sigNoise;
	env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);

	// sig1 = LFTri.ar(freq, mul: amp/2);
	// sig2 = LFTri.ar(freq/2, mul: amp/4);
	// sig3 = LFTri.ar(freq/4, mul: amp/8);
	// sig4 = LFTri.ar(freq/8, mul: amp/16);
	// sig5 = LFTri.ar(freq/16, mul: amp/32);


	// 좀 더 부드럽다.
	sig1 = LFPar.ar(freq, mul: amp/2);
	sig2 = LFPar.ar(freq/2, mul: amp/4);
	sig3 = LFPar.ar(freq/4, mul: amp/8);
	sig4 = LFPar.ar(freq/8, mul: amp/16);
	sig5 = LFPar.ar(freq/16, mul: amp/32);


	sig = sig1 + sig2 + sig3 + sig4 + sig5;
	// sig = LFTri.ar(freq, mul: amp/2);

	Out.ar(0, Pan2.ar(sig*env, 0, outAmp));

}).add;
)


(
~pb_mel = Pbind(
	\instrument, \tak,
	// \freq, Pseq([900, 900, 900, 850, 1100, 1300, 1600, 1400, 1200], inf),
	\freq, Pseq([900, 900, 900, 850, 900, 1200, 1100, 1300, 1600, 1400, 1200]/2*3, inf),
	// \dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*0.8, inf),
	// \dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*2.8, inf),
	\dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*2.8, inf),
	\atTime, 0.9,
	\relTime, 0.1
).play;
)




(
~pb_mel.stream = Pbind(
	\instrument, \tak,
	// \freq, Pseq([900, 900, 900, 850, 1100, 1300, 1600, 1400, 1200], inf),
	\freq, Pseq([900, 900, 900, 850, 900, 1200, 1100, 1300, 1600, 1400, 1200]*0.3, inf),
	// \dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*0.8, inf),
	// \dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*2.8, inf),
	\dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3], inf),
	\atTime, 0.9,
	\relTime, 0.1
).asStream;
)


(// floating?
~pb_mel_1 = Pbind(
	\instrument, \tak,
	\freq, Pseq([620, 330, 370, 500, 330, 380, 320], inf),
	// \dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*0.8, inf),
	// \dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*2.8, inf),
	\dur, 0.5,
	\atTime, 0.9,
	\relTime, 0.1
);


// floating - 2 (low)
~pb_mel_2 = Pbind(
	\instrument, \tak,
	\freq, Pseq([620, 330, 370, 500, 330, 380, 320]*0.3, inf),
	\dur, 0.5,
	\atTime, 0.9,
	\relTime, 0.1
);


// floating - 3
~pb_mel_3 = Pbind(
	\instrument, \tak,
	\freq, Pseq([620, 330, 370, 500, 330, 380, 320]*1.2, inf),
	\dur, 0.5,
	\atTime, 0.9,
	\relTime, 0.1
);
)

~cur = ~pb_mel_1.play;
~cur.stop;
~pb_mel_1.stop;
~cur = ~pb_mel_2.play;
~cur.stop;
~cur = ~pb_mel_3.play;
~cur.stop;



a = Synth(\tak, [\freq, 9980, \amp, 0.3]);



쇼핑백이 등장하면 뭔가 웃긴 멜로디가 나오면 좋겠는데
부유하는 상태에 대한

혹은 민하씨의 디렉션을 녹음?

군무때 하는 움직임의 대표적인 리듬 (살랑살랑과 덩덩이 동시에 나오는) 을 살려서 음악을 (미니멀 비트 or 조금 우스운 소리)
높은 음의 소리는 약간 안 어울리는 듯?


0419
널빤지 위태위태한 음악


김광석 노래를 0418의 패턴과 같이 틀면?
다른 것과 섞었을 때 끊김이 발생하는 이유는?



0421

널빤지 위태위태한 음악

뭔가 강렬한 비트 같은 것 추가 - 선시씨 움직임?

마지막 박자가 있는 군무에 들어갈 비트? 좀 시끄럽게 혹은 조용하게?