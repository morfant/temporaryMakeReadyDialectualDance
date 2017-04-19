(
SynthDef.new(\sal, {
	arg freq = 180, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, bfFreq_sig = 200, bfRq_sig = 0.3, noiseAmp = 0.5, noiseRate = 50, bfFreq_nos = 800, bfRq_nos = 0.5, atTime = 0.2, relTime = 0.4, curv = 5;
	var env, sig, sigNoise, hf;
	env = EnvGen.kr(Env.perc(atTime, relTime, curve: curv), gate, doneAction: 2);
	sig = LFTri.ar(freq, mul: amp);
	sig = BPF.ar(sig, bfFreq_sig, bfRq_sig, add: sig*0.2);
	sigNoise = PinkNoise.ar(amp*noiseAmp * Dust.kr(noiseRate));
	sigNoise = BPF.ar(sigNoise, bfFreq_nos, bfRq_nos);
	Out.ar(0, Pan2.ar((sig+sigNoise)*env, 0, outAmp));

}).add;
)


a = Synth(\sal, [\freq, 140, \amp, 0.7, \noiseRate, 500, \bfFreq_sig, 200, \bfRq_sig, 0.3, \bfFreq_nos, 1900, \bfRq_nos, 0.1, \curv, 2]);



(// dung dung
~pb_dum = Pbind(
	\instrument, \sal,
	\freq, Pseq([170, 170, 170, 150, 135, 100, 100, 135, 100, 100, 150]*1.0, inf),
	// \noiseRate, Pseq([60, 80, 90, 100, 200, 300, 400, 800, 500, 310, 330], inf),
	\noiseRate, 900,
	// \noiseAmp, Pseq((0.1, 0.19..1.0), inf),
	\noiseAmp, 1.0,
	\noiseAmp, Prand([1.0, 0.5, 0.2, 0.7], inf),
	\bfFreq_sig, Pseq([170, 170, 170, 150, 135, 100, 100, 135, 100, 100, 150]*0.88, inf),
	\bfRq_sig, Pseq([0.6, 0.05, 0.4, 0.05, 0.1, 0.8, 0.1, 0.8, 0.1, 0.8, 0.01], inf),
	\bfFreq_nos, Pseq([4000, 2000, 9000, 1800, 2700, 3000], inf),
	\bfRq_nos, Pseq([0.5, 0.3, 0.6, 0.2, 0.1, 0.4], inf),
	\amp, Pseq([0.5, 0.2, 0.5, 0.1], inf),
	\atTime, 0.3,
	\relTime, 0.1,
	\dur, Pseq([0.7, 0.4, 0.7, 0.35]*0.99, inf),
	\amp, 0.7
).play;
)


(// dung dung
~pb_dum.stream = Pbind(
	\instrument, \sal,
	\freq, Pseq([170, 170, 170, 150, 135, 100, 100, 100, 135, 100, 100, 170, 150], inf),
	\dens, Pseq((6..40), inf),
	\amp, 0.5,
	\dur, Pseq([1.0, 1.0, 1.0, 1.0]*0.4, inf)
).asStream;
)


(0.1, 0.19..1.0).size