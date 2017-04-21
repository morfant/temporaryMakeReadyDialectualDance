{SinOsc.ar(300)!2}.play;


(
var dens = 2;
var rate = 20;
// {Dust.kr(dens, 1) * LFTri.kr(rate)}.plot(1);
{Dust.kr(dens, 1) * LFNoise0.kr(rate)}.plot(1);
)




{Dust.kr(20, 50)}.plot(1)


(
SynthDef.new(\triwNoise, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, atTime = 0.2, relTime = 0.8, hfFreq = 6000, hfRq = 0.2;
	var env, sig, sigG, sigNoise, hf;
	// env = EnvGen.kr(Env.linen(sustainTime: 40));
	env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	// sigG = Dust.kr(dens, 50);
	// sigG = Dust2.kr(dens, freq/2, freq/2);
	// sigG = LFNoise0.kr(dens, freq/2, add: freq/2);
	sigG = LFNoise0.kr(dens, freq);
	// sig = LFPulse.ar(sigG, mul: amp);
	sigNoise = PinkNoise.ar((sigG - abs(sigG))/2);
	sigNoise = RHPF.ar(sigNoise, hfFreq, hfRq);
	// sigNoise = LFPulse.ar(16000, mul: (sigG - abs(sigG))/2);
	// sig = LFTri.ar(sigG, mul: amp);
	sig = Pulse.ar(sigG, mul: amp);
	// sig = LFPar.ar(sigG, mul: amp);

	// Out.ar(0, Pan2.ar(sig*env, 0, outAmp));
	Out.ar(0, Pan2.ar((sig*env) +
		(sigNoise*0.05*(((sigG - abs(sigG))/2).reciprocal))*env,
		0, outAmp));

}).add;
)


d = Synth(\triwNoise, [\freq, 100, \dens, 8, \amp, 0.05]);
d.set(\freq, 20, \dens, 20, \amp, 0.5, \outAmp, 0.5);
// 예측할 수 없는 것이 나온다.

(
~pb1 = Pbind(
	\instrument, \triwNoise,
	\freq, 10,
	\dens, 8,
	\amp, 0.05,
	\atTime, 0.4,
	\relTime, 0.6,
	\dur, 0.5
).play;
)

~pb1.stop;

(
~pb1.stream = Pbind(
	\instrument, \triwNoise,
	// \freq, Pseq([5000, 9000, 900, 100, 10, 200], inf),
	\freq, Pseq([1000, 1000, 1000, 1000, 1000, 1000]/100, inf),
	\dens, 7,
	\atTime, 0.3,
	\relTime, 0.3,
	\amp, 0.1,
	\dur, 0.3
).asStream;
)



(
~pb1.stream = Pbind(
	\instrument, \triwNoise,
	// \freq, Pseq([5000, 9000, 900, 100, 10, 200], inf),
	\freq, Pseq([1000, 1000, 1000, 100, 1000, 1000]/200, inf),
	\dens, 7,
	\atTime, 0.1,
	\relTime, 0.4,
	\amp, 0.5,
	\dur, 0.6
).asStream;
)


(
~pb1.stream = Pbind(
	\instrument, \triwNoise,
	// \freq, Pseq([5000, 9000, 900, 100, 10, 200], inf),
	\freq, Pseq([1000, 1000, 1000, 800, 1000, 1000]/200, inf),
	\dens, 7,
	\atTime, 0.1,
	\relTime, 0.4,
	\amp, 0.5,
	\dur, 0.6,
	\hfFreq, Pseq([7000, 9000, 8000, 11000, 2000, 1000], inf),
	\hfRq, 0.4

).asStream;
)




(// 그냥 한 번 깔아보자.
~pb1.stream = Pbind(
	\instrument, \triwNoise,
	\freq, Pseq([400, 200, 600]*100, inf),
	\dens, Pseq([20, 4, 16, 7, 8, 64], inf),
	\atTime, 0.2,
	\relTime, 0.1,
	\amp, 0.5,
	// \dur, Pseq([0.3, 0.7, 1, 0.8, 0.2, 1], inf)
	\dur, 0.3,
	\hfFreq, Pseq([9000, 9000, 8000, 11000, 200, 1000], inf),
	\hfRq, 0.4
).asStream;
)


(// 그냥 한 번 깔아보자.
~pb1.stream = Pbind(
	\instrument, \triwNoise,
	\freq, Pseq([400, 200, 600]*100, inf),
	\dens, Pseq([10, 4, 6, 7, 8, 14], inf),
	\atTime, 0.2,
	\relTime, 0.1,
	\amp, 0.1,
	// \dur, Pseq([0.3, 0.7, 1, 0.8, 0.2, 1], inf)
	\dur, Pseq([0.3, 0.1, 0.4, 0.2, 0.1, 0.06, 0.1], inf),
	// \hfFreq, Pseq([9000, 9000, 8000, 11000, 200, 1000], inf),
	\hfFreq, Pseq([1000, 2000, 1000, 2000, 100, 1000], inf),
	\hfRq, 0.1
).asStream;
)




(
SynthDef.new(\tri, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1;
	var env, sig, sigG, sigNoise;
	env = EnvGen.kr(Env.linen(sustainTime: 40));
	// env = EnvGen.kr(Env.perc(), gate, doneAction: 2);
	// sigG = Dust.kr(dens, 50);
	// sigG = Dust2.kr(dens, freq/2, freq/2);
	// sigG = LFNoise0.kr(dens, freq/2, add: freq/2);
	sigG = LFNoise0.kr(dens, freq/2, freq/2);
	sig = LFPulse.ar(sigG, mul: amp);
	// sig = LFTri.ar(sigG, mul: amp);
	// sig = Pulse.ar(sigG, mul: amp);
	// sig = LFPar.ar(sigG, mul: amp);

	// Out.ar(0, Pan2.ar(sig*env, 0, outAmp));
	Out.ar(0, Pan2.ar(sig*env, 0, outAmp));

}).add;
)

c = Synth(\tri, [\freq, 16, \dens, 20, \amp, 0.2]);
c.set(\freq, 9, \dens, 22, \amp, 0.4);
c.set(\freq, 16, \dens, 20, \amp, 0.2);


(
SynthDef.new(\jabNoise, {
	arg freq = 10, dens = 10, rate = 1.4, amp = 0.5, outAmp = 0.5, gate = 1;
	var sig;

	var sigRythm = Dust.kr(dens, 1) * LFNoise0.kr(rate);
	// var sig = LFTri.ar(freq, mul: sigRythm);
	sig = LFTri.ar(freq, mul: sigRythm);
	// env = EnvGen.kr(Env.perc(0.01, curve: 0), gate, doneAction: 2);

	// Out.ar(0, Pan2.ar(sig*env, 0, outAmp));
	// Out.ar(0, Pan2.ar(sig*env, Dust2.kr(4), outAmp));
	Out.ar(0, Pan2.ar(sig, Dust2.kr(4), outAmp));

}).add;
)


{Dust2.kr(4)}.plot(1);

a = Synth(\jabNoise, [\freq, 9000, \amp, 0.5]);
a.set(\freq, 19000, \amp, 2.7, \dens, 3, \rate, 2, \outAmp, 2.0);
a.free;

(
var dens = 20;
var densL = 2;
var densR = 20;
var rate = 200;
{Dust.kr([densL, densR], 1) * LFTri.kr(rate)}.plot(1);
)


{Dust.kr([10, 1], 1)}.plot(1);

a = Synth("jabNoise", [\dens, 8, \freq, 180, \amp, 0.5, \rate, 7]); // 락킹
a.set(\dens, 19, \freq, 100, \amp, 1.2, \rate, 6, \outAmp, 1.0); // 락킹
a = Synth(\jabNoise, [freq: [200, 40, 192], dens: 60, rate: 3 ]);
a.set(\dens, 3, \freq, 180, \amp, 0.5, \rate, 7); // 락킹
a.set(\dens, [3, 10], \freq, [180, 9000], \amp, 0.5, \rate, [7, 2]); // 락킹

b = Synth("t", [\freq, 100, \dens, 4, \rate, 10]);
c = Synth("t", [\freq, 9000, \dens, 60, \rate, 100, \amp, 0.01]);
b.set(\dens, 20, \freq, 4000);
b.set(\dens, 200, \freq, 4000);

(
r = 3.0.rand;
a.set(\rate, r);
)



a.set(\dens, 100, \freq, 200, \amp, 0.5, \rate, 1);
a.set(\dens, 1000, \freq, 6900, \amp, 0.5);

b.set(\freq, 600, \rate, 2);

c.set(\dens, 4, \freq, 300);




// 김광석 노래 음높이에 비례하여 dens를 높이기 - 실제로는 마우스 컨트롤?


FreqScope.new()




{Dust.kr(30, 1)}.plot(1)




// 간단한 리프를 만들 수 있는 패턴(Pbind);



ㅁ