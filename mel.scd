(
SynthDef.new(\tak, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, atTime = 0.3, relTime = 0.4;
	var env, sig, sig1, sig2, sig3, sig4, sig5, sigG, sigNoise;
	env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);

	sig1 = LFTri.ar(freq, mul: amp/2);
	sig2 = LFTri.ar(freq/2, mul: amp/4);
	sig3 = LFTri.ar(freq/4, mul: amp/8);
	sig4 = LFTri.ar(freq/8, mul: amp/16);
	sig5 = LFTri.ar(freq/16, mul: amp/32);

	sig = sig1 + sig2 + sig3 + sig4 + sig5;
	// sig = LFTri.ar(freq, mul: amp/2);

	Out.ar(0, Pan2.ar(sig*env, 0, outAmp));

}).add;
)


(
~pb_mel = Pbind(
	\instrument, \tak,
	\freq, Pseq([900, 900, 1100, 1300, 1600, 1400, 1200]*6, inf),
	\dur, Pseq([0.5, 0.5, 0.3, 0.3, 0.8, 0.25, 0.3]*0.8, inf),
	\atTime, 0.9,
	\relTime, 0.1
).play;

)

a = Synth(\tak, [\freq, 9980, \amp, 0.3]);



쇼핑백이 등장하면 뭔가 웃긴 멜로디가 나오면 좋겠는데
부유하는 상태에 대한

혹은 민하씨의 디렉션을 녹음?

