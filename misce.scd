

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



