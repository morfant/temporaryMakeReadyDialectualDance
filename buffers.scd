
//---------------------------- 0: EQ ----------------------------
~masterEQ = ChannelEQ.new(2, s, 0, 0);

~masterEQ.gui.onSelect('x_flat');



//---------------------------- 1: Buffers ----------------------------
// buffers
(
// ~tt = Buffer.read(s, "/Users/giy/Desktop/TMRDD/32.aiff");
// ~tt.play;

// ~for = Buffer.read(s, "/Users/giy/Desktop/TMRDD/forme.aiff");
// ~for.play;

// ~book = Buffer.read(s, "/Users/giy/Desktop/TMRDD/book.aiff");
// ~book.play;

~na1 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/na1.aiff");
~na1.play;

~na2 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/na2.aiff");
~na2.play;

~na3 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/na3.aiff");
~na3.play;


~kim = Buffer.read(s, "/Users/giy/Desktop/TMRDD/kim.aiff");
// ~kim.play;
)



//---------------------------- 2: Synths ----------------------------
(
/*SynthDef(\tt, //thirty two
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~tt, BufRateScale.kr(~tt)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~tt.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\for,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~for, BufRateScale.kr(~for)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~for.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;

SynthDef(\book,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~book, BufRateScale.kr(~book)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~book.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;*/


// new narations
SynthDef(\na1,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~na1, BufRateScale.kr(~na1)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na1.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\na2,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~na2, BufRateScale.kr(~na2)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na2.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\na3,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(1, ~na3, BufRateScale.kr(~na3)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na3.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\kim,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, atTime = 10.0, relTime = 10.0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~kim, BufRateScale.kr(~kim)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(atTime, ~kim.numFrames/s.sampleRate - (atTime + relTime), relTime), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;


// Sound Synths
// Noise 1
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


// Noise 2
SynthDef.new(\jabNoise, {
	arg freq = 10, dens = 10, rate = 1.4, amp = 0.5, outAmp = 0.5, gate = 1, atTIme = 0.01, relTime = 0.1;
	var sig, env;

	// var sigRythm = Dust.kr(dens, 1) * LFNoise0.kr(rate);
	var sigRythm = LFNoise0.kr(rate, add: 1)/2;
	// var sigRythm = Dust.kr(dens, 1);
	// var sig = LFTri.ar(freq, mul: sigRythm);
	// sig = LFTri.ar(freq, mul: sigRythm);
	// sig = LFSaw.ar(freq, mul: sigRythm);
	// sig = LFPar.ar(freq, mul: sigRythm);
	sig = LFPulse.ar(freq, mul: sigRythm);
	env = EnvGen.kr(Env.perc(atTIme, relTime, curve: 5), gate, doneAction: 2);

	Out.ar(0, Pan2.ar(sig*env, 0, outAmp));
	// Out.ar(0, Pan2.ar(sig*env, Dust2.kr(4), outAmp));
	// Out.ar(0, Pan2.ar(sig, Dust2.kr(4), outAmp));

}).add;


// Melodic
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


// sal rang sal rang
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


// nul pan ji
SynthDef.new(\nul, {
	arg freq = 470, amp_1 = 0.5, amp_2 = 0.5, outAmp = 0.5, freqDiff = 1;
	var env, sig, sig2;
	sig = SinOsc.ar(freq, mul: amp_1);
	sig2 = SinOsc.ar(freq - freqDiff, mul: amp_2);

	Out.ar(0, Pan2.ar(sig + sig2, 0, outAmp));

}).add;


// Ending
SynthDef(\dds, {| freq = 1, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1, hfFreq1 = 100, hfFreq2 = 200,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7, freqDiff = 2|
	var sig, env, sig2, sig_beating, del, mod, lowcut_sig, lowcut_sig2;
	// sig = Blip.ar(freq);
	// sig = LFPar.ar(freq);

	sig = LFPulse.ar(freq);
	sig_beating = LFPulse.ar(freq - freqDiff);
	// sig_beating = LFPar.ar(freq - freqDiff);
	// sig = LFTri.ar(freq);
	sig = LPF.ar(sig + sig_beating, filfreq, add: 0);

	sig2 = Impulse.ar(nf, mul: amp2);
	// sig2 = LFNoise0.kr(nf);
	// sig2 = LFNoise0.ar(nf);
	// env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	env = EnvGen.kr(Env.adsr(atTime, atTime/2, 1, relTime), gate, doneAction: 2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, hfFreq1, add: 0);
	lowcut_sig2 = HPF.ar(sig2, hfFreq2);

	// Out.ar(0, Pan2.ar((sig + sig2) * env, pan, amp));
	Out.ar(0, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;


SynthDef(\dds2, {| freq = 1, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1, hfFreq1 = 100, hfFreq2 = 200,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7, freqDiff = 2|
	var sig, env, sig2, sig_beating, del, mod, lowcut_sig, lowcut_sig2;
	// sig = Blip.ar(freq);
	sig = LFPar.ar(freq);

	// sig = LFPulse.ar(freq);
	// sig_beating = LFPulse.ar(freq - freqDiff);
	sig_beating = LFPar.ar(freq - freqDiff);
	// sig = LFTri.ar(freq);
	sig = LPF.ar(sig + sig_beating, filfreq, add: 0);

	sig2 = Impulse.ar(nf, mul: amp2);
	// sig2 = LFNoise0.kr(nf);
	// sig2 = LFNoise0.ar(nf);
	// env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction: 2);
	env = EnvGen.kr(Env.adsr(atTime, atTime/2, 1, relTime), gate, doneAction: 2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	lowcut_sig = HPF.ar(sig, hfFreq1, add: 0);
	lowcut_sig2 = HPF.ar(sig2, hfFreq2);

	// Out.ar(0, Pan2.ar((sig + sig2) * env, pan, amp));
	Out.ar(0, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;


// Dum
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


//---------------------------- 3: Patterns ----------------------------

// mel
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



// Noise 1
~pb_nos_1 = Pbind(
	\instrument, \triwNoise,
	\freq, 10,
	\dens, 8,
	\amp, 0.05,
	\atTime, 0.4,
	\relTime, 0.6,
	\dur, 0.5
);




~pb_nos_2 = Pbind(
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
);




// Sal rang
~pb_sal_1 = Pbind(
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
);



// Dum
~pb_dum_basic = Pbind(
	\instrument, \dum,
	\freq, 100,
	\dens, 5,
	\amp, 0.5,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf),
	\hfFreq, 60
);



~pb_dum_fast = Pbind(
	\instrument, \dum,
	\freq, 100,
	\dens, 10,
	\amp, 1.3,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf)
);


~pb_dum_slow = Pbind(
	\instrument, \dum,
	\freq, 90,
	\dens, 1,
	\amp, 1.2,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf)
);

);



//---------------------------- 4: Synth sets ----------------------------

// Noise 2
~masterEQ.gui.onSelect('x_flat');a.free;a = Synth("jabNoise", [\dens, 3, \freq, 100, \amp, 1.0, \rate, 17]); // 락킹
a.set(\dens, 19, \freq, 100, \amp, 1.2, \rate, 6, \outAmp, 1.0); // 락킹
a.free;


(
~pb_rocking = Pbind.new(
	\instrument, \jabNoise,
	\dur, Pseq([0.1, 0.1, 0.2, 0.3, 0.1, 0.2, 0.1, 0.04, 0.005]*0.9, inf),
	\freq, Pseq([100, 120, 80, 130, 105, 110]*2, inf),
	\rate, Prand([10, 6, 4, 7, 9], inf),
	\atTime, Prand([0.05, 0.01, 0.02, 0.03]*0.01, inf),
	\relTime, 0.02
).play;


)


// nul pan ji
a = Synth(\nul, [\freq, 470, \freqDiff, 2, \amp_1, 0.1, \amp_2, 0.1, \outAmp, 0.3]);
a.set(\freq, 520, \freqDiff, 1);
a.set(\freq, 470, \freqDiff, 3);
// 번갈아 가도록



// Ending
a.free;a = Synth(\dds, [\freq, 2000, \freqDiff, 3, \amp, 0.5, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 3000,  \nf, 1.2]);

a.set(\nf, 2, \freq, 2, \filFreq, 100, \susTime, 1);
a.free;a = Synth(\dds, [\nf, 0.2, \freq, 2, \filFreq, 100, \susTime, 4]);
a.free;

b.free;b = Synth(\dds, [\freq, 1, \freqDiff, 2, \amp, 0.9, \filfreq, 100, \hfFreq1, 100, \hfFreq2, 5000, \nf, 3]);
b.free;

c.free;c = Synth(\dds, [\freq, 0.5, \freqDiff, 18, \amp, 0.9, \filfreq, 180, \hfFreq1, 100, \hfFreq2, 50, \nf, 1]);
c.free;

d.free;
d.free;d = Synth(\dds, [\freq, 1.5, \freqDiff, 18, \amp, 0.1, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 1]);

e.free;
e.free;e =  Synth(\dds2, [\freq, 1.5, \freqDiff, 13, \amp, 0.1, \filfreq, 4080, \hfFreq1, 100, \hfFreq2, 100, \nf, 1]);
// 현상 유지 시키려면?

// Noise + Bass
~t.stop;~a.stop;~masterEQ.gui.onSelect('nb');~t = ~pb_nos_1.play;~a = ~pb_dum_basic.play;
~t.stop;~a.stop;~masterEQ.gui.onSelect('x_flat');~t = ~pb_nos_2.play;~a = ~pb_dum_basic.play;
~t.stop;~a.stop;

~a = ~pb_dum_basic.play;
~b = ~pb_dum_fast.play;
~c = ~pb_dum_slow.play;
~a.stop;
~b.stop;
~c.stop;



~pb_nos_1.stream = Pbind(
	\instrument, \triwNoise,
	\freq, 10,
	\dens, 8,
	\amp, 0.05,
	\atTime, 0.1,
	\relTime, 0.05,
	\dur, 0.1
).asStream;



~t.stream = Pbind(
	\instrument, \triwNoise,
	\freq, Pseq([400, 200, 600]*100, inf),
	\dens, Pseq([10, 4, 6, 7, 8, 14], inf),
	\atTime, 0.1,
	\relTime, 0.1,
	\amp, 0.1,
	// \dur, Pseq([0.3, 0.7, 1, 0.8, 0.2, 1], inf)
	\dur, Pseq([0.3, 0.1, 0.4, 0.2, 0.1, 0.06, 0.1]*0.5, inf),
	// \hfFreq, Pseq([9000, 9000, 8000, 11000, 200, 1000], inf),
	\hfFreq, Pseq([1000, 2000, 1000, 2000, 100, 1000], inf),
	\hfRq, 0.3
).asStream;





// mel
~masterEQ.gui.onSelect('x_flat');~m1 = ~pb_mel_1.play;
~m1.stop;
~m2 = ~pb_mel_2.play;
~m2.stop;
~m3 = ~pb_mel_3.play;
~m3.stop;




