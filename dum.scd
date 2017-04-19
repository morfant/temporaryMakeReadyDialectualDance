(
SynthDef.new(\dum, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, hfFreq = 80;
	var env, sig, sigG, sigNoise, hf;
	env = EnvGen.kr(Env.perc(), gate, doneAction: 2);
	sigG = LFNoise0.kr(dens, freq/2, freq/2);
	sig = LFPar.ar(sigG, mul: amp);
	sig = HPF.ar(sig, hfFreq);
	Out.ar(0, Pan2.ar(sig*env, 0, outAmp));

}).add;
)


a = Synth(\dum, [\freq, 100]);


(
~pb_dum = Pbind(
	\instrument, \dum,
	\freq, 100,
	\dens, 5,
	\amp, 0.5,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf),
	\hfFreq, 60
).play;
)



(
~pb_dum.stream = Pbind(
	\instrument, \dum,
	\freq, 100,
	\dens, 10,
	\amp, 1.3,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf)
).asStream;
)


(
~pb_dum.stream = Pbind(
	\instrument, \dum,
	\freq, 90,
	\dens, 1,
	\amp, 1.2,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf)
).asStream;
)


