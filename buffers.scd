
//---------------------------- 0: EQ ----------------------------
(
// SLIDER
~win = Window.new("4 CH mixer", Rect(1920, 0, 400, 400)).front;

~num_0 = NumberBox(~win, Rect(20, 20, 60, 40));
~num_1 = NumberBox(~win, Rect(20, 120, 60, 40));
~num_2 = NumberBox(~win, Rect(20, 220, 60, 40));
~num_3 = NumberBox(~win, Rect(20, 320, 60, 40));

~scale = 3.0;

~slid_0 = Slider(~win, Rect(100, 20, 200, 40)).action_({
	postln("slid_0: " + ~slid_0.value.round(0.01));
	~num_0.value_((~slid_0.value*~scale).round(0.01));
	~mixer.set(\amp_0, ~slid_0.value*~scale);
});

~slid_1 = Slider(~win, Rect(100, 120, 200, 40)).action_({
	postln("slid_1: " + ~slid_1.value.round(0.01));
	~num_1.value_((~slid_1.value*~scale).round(0.01));
	~mixer.set(\amp_1, ~slid_1.value*~scale);
});

~slid_2 = Slider(~win, Rect(100, 220, 200, 40)).action_({
	postln("slid_2: " + ~slid_2.value.round(0.01));
	~num_2.value_((~slid_2.value*~scale).round(0.01));
	~mixer.set(\amp_2, ~slid_2.value*~scale);
});

~slid_3 = Slider(~win, Rect(100, 320, 200, 40)).action_({
	postln("slid_3: " + ~slid_3.value.round(0.01));
	~num_3.value_((~slid_3.value*~scale).round(0.01));
	~mixer.set(\amp_3, ~slid_3.value*~scale);
});


// 기본값 셋업
~slid_0.value_(1.0/~scale);
~num_0.value_(~slid_0.value);

~slid_1.value_(1.0/~scale);
~num_1.value_(~slid_1.value);

~slid_2.value_(1.0/~scale);
~num_2.value_(~slid_2.value);

~slid_3.value_(1.0/~scale);
~num_3.value_(~slid_3.value);



// Mixer
SynthDef.new(\mixer,
	{
		arg amp_0 = 0.5, amp_1 = 0.5, amp_2 = 0.5, amp_3 = 0.5, amp_master = 1.0;
		var sig_0, sig_1, sig_2, sig_3;
		sig_0 = In.ar(100, 2);
		sig_1 = In.ar(102, 2);
		sig_2 = In.ar(104, 2);
		sig_3 = In.ar(106, 2);

		Out.ar(0, ((sig_0*amp_0) + (sig_1*amp_1) + (sig_2*amp_2) + (sig_3*amp_3))*amp_master);

	}
).add;




// EQ
~masterEQ = ChannelEQ.new(2, s, 0, 0);
~masterEQ.gui.onSelect('x_flat');
~mixer.free; ~mixer = Synth(\mixer, [\amp_0, 1.0, \amp_1, 0.5,  \amp_2, 0.5,  \amp_3, 0.5 ]);
);



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
// ~na1.play;

~na2 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/na2.aiff");
// ~na2.play;

~na3 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/na3.aiff");
// ~na3.play;

~kim = Buffer.read(s, "/Users/giy/Desktop/TMRDD/kim.aiff");
// ~kim.play;

~ha =  Buffer.read(s, "/Users/giy/Desktop/TMRDD/ha.aiff");
// ~ha.play;

~mf1 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/mf_1.aiff");
// ~mf1.play;
// ~mf1.free;

~mf2 = Buffer.read(s, "/Users/giy/Desktop/TMRDD/mf_2.aiff");
// ~mf2.play;
// ~mf2.free;

~end_beat = Buffer.read(s, "/Users/giy/Desktop/TMRDD/end_beat.aiff");
// ~end_beat.play;

)

s.meter

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
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, outBus = 106 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~na1, BufRateScale.kr(~na1)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na1.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(outBus, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\na2,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, outBus = 106 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~na2, BufRateScale.kr(~na2)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na2.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(outBus, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\na3,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, outBus = 106 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~na3, BufRateScale.kr(~na3)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~na3.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(outBus, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\ha,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, outBus = 106 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~ha, BufRateScale.kr(~ha)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(0.01, ~ha.numFrames/s.sampleRate, 0.2), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(outBus, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\kim,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, atTime = 10.0, relTime = 10.0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~kim, BufRateScale.kr(~kim)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(atTime, ~kim.numFrames/s.sampleRate - (atTime + relTime), relTime), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\mf1,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, start = 0, susTime = 1.0, rate = 1, loop = 0, atTime = 0.1, relTime = 0.1, outBus = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~mf1, BufRateScale.kr(~mf1)*rate, startPos: start, loop: loop, doneAction: 2);
		// env = EnvGen.kr(Env.linen(atTime, ~mf1.numFrames/s.sampleRate - (atTime + relTime), relTime), gate, doneAction:2);
		env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(outBus, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\mf2,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, start = 0, susTime = 1.0, rate = 1, loop = 0, atTime = 0.1, relTime = 0.1, outBus = 0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~mf2, BufRateScale.kr(~mf2)*rate, startPos: start, loop: loop, doneAction: 2);
		// env = EnvGen.kr(Env.linen(atTime, ~mf2.numFrames/s.sampleRate - (atTime + relTime), relTime), gate, doneAction:2);
		env = EnvGen.kr(Env.linen(atTime, susTime, relTime), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(outBus, Pan2.ar((sig1) * env, pan, amp));
}).add;


SynthDef(\kim,
	{| freq = 1, bufnum = 0, gate = 1, amp = 0.1, pan = 0, rate = 1, loop = 0, atTime = 10.0, relTime = 10.0 |
		var sig1, env;
		sig1 = PlayBuf.ar(2, ~kim, BufRateScale.kr(~kim)*rate, startPos: 0, loop: loop, doneAction: 2);
		env = EnvGen.kr(Env.linen(atTime, ~kim.numFrames/s.sampleRate - (atTime + relTime), relTime), gate, doneAction:2);
	//env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	Out.ar(0, Pan2.ar((sig1) * env, pan, amp));
}).add;



// Comp for ending
SynthDef(\comp,
	{
		arg ths = 0.1, clampTime = 0.001, startBus = 60, outBus = 0, amp = 1.0;
		var finalSig, sigSum, sig0, sig1, sig2, sig3, sig4, sig5, sig6, sig7;
		sig0 = In.ar(startBus, 2);
		sig1 = In.ar(startBus + 2, 2);
		sig2 = In.ar(startBus + 4, 2);
		sig3 = In.ar(startBus + 6, 2);
		sig4 = In.ar(startBus + 8, 2);
		sig5 = In.ar(startBus + 10, 2);
		sig6 = In.ar(startBus + 12, 2);
		sig7 = In.ar(startBus + 20, 2);
		// sig8 = In.ar(60, 2);

		sigSum = sig0 + sig1 + sig2 + sig3 + sig4 + sig5 + sig6 + sig7;
		// finalSig = CompanderD.ar(sigSum, clampTime: 0.001, mul: 0.9);
		finalSig = Compander.ar(sigSum, clampTime: 0.001, mul: 0.9);

		Out.ar(outBus, finalSig*amp);

	}
).add;


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
	arg freq = 10, dens = 10, rate = 1.4, amp = 0.5, outAmp = 1.0, gate = 1, atTIme = 0.01, relTime = 0.1;
	var sig, env;

	// var sigRythm = Dust.kr(dens, 1) * LFNoise0.kr(rate);
	var sigRythm = LFNoise0.kr(rate, add: 1)/2;
	// var sigRythm = Dust.kr(dens, 1);
	// var sig = LFTri.ar(freq, mul: sigRythm);
	sig = LFTri.ar(freq, mul: sigRythm);
	// sig = LFSaw.ar(freq, mul: sigRythm);
	// sig = LFPar.ar(freq, mul: sigRythm);
	// sig = LFPulse.ar(freq, mul: sigRythm);
	env = EnvGen.kr(Env.perc(atTIme, relTime, curve: 5), gate, doneAction: 2);

	Out.ar(0, Pan2.ar(sig*env, 0, outAmp));
	// Out.ar(0, Pan2.ar(sig*env, Dust2.kr(4), outAmp));
	// Out.ar(0, Pan2.ar(sig, Dust2.kr(4), outAmp));

}).add;


// Melodic
SynthDef.new(\tak, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, atTime = 0.3, relTime = 0.4, outBus = 100;
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

	Out.ar(outBus, Pan2.ar(sig*env, 0, outAmp));

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
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7, freqDiff = 2, outBus = 0 |
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
	Out.ar(outBus, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;


SynthDef(\dds2, {| freq = 1, modfreq = 5, amp = 0.6, amp2 = 0.9, filfreq = 300, rq = 0.1, gate = 1, hfFreq1 = 100, hfFreq2 = 200,
	atTime = 0.1, susTime = 0.1, relTime = 0.9, pan = 0, nf = 7, freqDiff = 2, outBus = 0 |
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
	Out.ar(outBus, Pan2.ar((lowcut_sig + lowcut_sig2) * env, pan, amp));
}).add;


// Dum
SynthDef.new(\dum, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, hfFreq = 80, outBus = 104, atTime = 0.01, relTime = 1;
	var env, sig, sigG, sigNoise, hf;
	env = EnvGen.kr(Env.perc(atTime, relTime), gate, doneAction: 2);
	sigG = LFNoise0.kr(dens, freq/2, freq/2);
	sig = LFPar.ar(sigG, mul: amp);
	sig = HPF.ar(sig, hfFreq);
	Out.ar(outBus, Pan2.ar(sig*env, 0, outAmp));

}).add;


// Ting
SynthDef.new(\ting, {
	arg freq = 10, dens = 5, amp = 0.5, outAmp = 0.5, gate = 1, hfFreq = 80, outBus = 0;
	var env, sig, hf;
	env = EnvGen.kr(Env.perc(), gate, doneAction: 2);
	sig = LFPar.ar(freq, mul: amp);
	sig = HPF.ar(sig, hfFreq);
	Out.ar(outBus, Pan2.ar(sig*env, 0, outAmp));

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
	\relTime, 0.1,
	\amp, 0.5,
	\outBus, 100
);


// floating - 2 (low)
~pb_mel_2 = Pbind(
	\instrument, \tak,
	\freq, Pseq([620, 330, 370, 500, 330, 380, 320]*0.3, inf),
	\dur, 0.5,
	\atTime, 0.9,
	\relTime, 0.1,
	\amp, 0.5,
	\outBus, 102
);


// floating - 3
~pb_mel_3 = Pbind(
	\instrument, \tak,
	\freq, Pseq([620, 330, 370, 500, 330, 380, 320]*1.2, inf),
	\dur, 0.5,
	\atTime, 0.9,
	\amp, 0.5,
	\relTime, 0.1
);


/*// floating - 3
~pb_mel_release = Pbind(
	\instrument, \tak,
	\freq, Pseq([620, 330, 370, 500, 330, 380, 320]*1.2, inf),
	\dur, 0.5,
	\atTime, 0.9,
	\relTime, 0.1,
	\amp, Pseq((0.5, 0.4..0.0), 6)
);*/



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
	\amp, 1.4,
	\dur, Prand([1.0, 0.8, 0.7, 0.3, 1.5], inf)
);



// 대야씬
~bucket_amp = 0.6;
~pb_bucket = Pbind(
	\instrument, \mf2,
	\rate, Pseq([

		1, 0.5, -2, 5, 1, 1, 0.2, 0.9

	]*2*(-1), inf),
	\susTime, 0.05,
	\dur, 0.6, // 처음 - 느리게
	\start, Pseq([

		10, 200, 30, 20, 280, 120, 70, 5,
		10, 20, 30, 20, 90, 280, 70, 5,
		10, 120, 230, 320, 90, 280, 70, 5

	]*s.sampleRate, inf),
	\amp, Pseq([0.5, 0.5, 0.6, 0.4, 0.1, 0.4, 0.4]*~bucket_amp, inf)
);


~pb_bucket_fast = Pbind(
	\instrument, \mf2,
	\rate, Pseq([

		1, 0.5, -2, 5, 1, 1, 0.2, 0.9

	]*2*(-1), inf),
	\susTime, 0.05,
	\dur, 0.5, // 셋이 될 때 - 좀 더 빠르게
	\start, Pseq([

		10, 200, 30, 20, 280, 120, 70, 5,
		10, 20, 30, 20, 90, 280, 70, 5,
		10, 120, 230, 320, 90, 280, 70, 5

	]*s.sampleRate, inf),
	\amp, Pseq([0.5, 0.5, 0.6, 0.4, 0.1, 0.4, 0.4]*~bucket_amp, inf)
);


// wing - 의자씬
~pb_chair = Pbind(
	\instrument, \mf2,
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
	\amp, Pseq([
		0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
		0.05, 0.05, 0.05, 0.05, 0.05, 0.05,
		0.05, 0.05, 0.05, 0.05, 0.05, 0.05

	]/10, inf) // 더 작게
);



// trum - 침대옷장
~pb_bed = Pbind(
	\instrument, \mf2,
	\rate, Pseq([1, 1, 1, 1.8, 1.0], inf),
	\susTime, 0.6,
	\atTime, Pseq([0.1]/2, inf),
	\relTime, 0.01,
	\dur, Pseq([2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3]*(7/6)*0.4, inf),
	\start, s.sampleRate*331,	// trum
	\amp, 0.8
);



// noise beat - 선반트리오
~pb_shelf = Pbind(
	\instrument, \mf2,
	\rate, Pseq([1, 1, 1, 1, 1, 0.8, 1, 1, 1, 1, 1, 1.2, 1, 1, 1, 1, 1, 1.4, 1, 1, 1, 1, 1, 1.2, 1, 1, 1, 1, 1, 1.6]/2, inf),
	\susTime, 0.6,
	\atTime, Pseq([0.1]/2, inf),
	\relTime, 0.01,
	\dur, Pseq([

		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3,
		2/3+0.3, 1, 0.7, 2/3+0.2, 2/3, 2/3+0.3

	]*(7/6)*0.4, inf),
	\start, s.sampleRate*410, // dist noise
	\amp, 0.6,
	\outBus, 104

);


// 세탁기 + 변칙적인 긴 호흡
~pb_wm_1 = Pbind(
	\instrument, \mf2,
	\rate, 1,
	\susTime, 1.0,
	\start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	// \start, Pseq([40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]/3, inf)
);


~pb_wm_2 = Pbind(
	\instrument, \mf2,
	\rate, 1,
	\susTime, 1.0,
	// \start, Pseq([10, 20, 30, 40]*s.sampleRate, inf),
	\start, Pseq([40]*s.sampleRate, inf),
	\amp, Pseq([0.8, 0.8, 0.6, 0.6]/3, inf)
);


~r = 0.8;
~pb_ddan = Pbind(
	\instrument, \mf1,
	\rate, 1*~r,
	\susTime, 2.68*2,
	\dur, 2.68*2,
	\start, s.sampleRate*120,
	\amp, 0.07
);


~r2 = 2.8;
~pb_taltal = Pbind(
	\instrument, \mf1,
	\rate, 1*~r2,
	\susTime, 2.7*2,
	\dur, 2.68*2,
	\start, s.sampleRate*68,
	\amp, 0.1
);



// 브릿지
~pb_bridge = Pbind(
	\instrument, \mf2,
	\rate, Pseq([0.2, 0.6, 0.8, 0.1]*1.8, inf),
	\susTime, 0.4,
	\atTime, Pseq([0.07], inf),
	\relTime, 0.1,
	\dur, Pseq([2/3+0.3, 1, 0.9, 0.7]*(7/6)*0.3*2, inf),
	\start, s.sampleRate*382,	// trum
	\amp, 0.4
);



);



//---------------------------- 4: Synth sets ----------------------------

// Noise 2
~masterEQ.gui.onSelect('x_flat');a.free;a = Synth("jabNoise", [\dens, 3, \freq, 100, \amp, 1.0, \rate, 17]); // 락킹
a.set(\dens, 19, \freq, 100, \amp, 1.2, \rate, 6, \outAmp, 1.0); // 락킹
a.free;




// nul pan ji
a = Synth(\nul, [\freq, 470, \freqDiff, 2, \amp_1, 0.1, \amp_2, 0.1, \outAmp, 0.3]);
a.set(\freq, 520, \freqDiff, 1);
a.set(\freq, 470, \freqDiff, 3);
// 번갈아 가도록




// Noise + Bass
~t.stop;~a.stop;~masterEQ.gui.onSelect('nb');~t = ~pb_nos_1.play;~a = ~pb_dum_basic.play;
~t.stop;~a.stop;~masterEQ.gui.onSelect('x_flat');~t = ~pb_nos_2.play;~a = ~pb_dum_basic.play;
~t.stop;~a.stop;






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







//<todo>
김광석 노래 관련 씬 정리
3번째 나레이션과 오버랩


