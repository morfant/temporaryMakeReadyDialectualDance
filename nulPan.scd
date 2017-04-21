(
SynthDef.new(\nul, {
	arg freq = 470, amp_1 = 0.5, amp_2 = 0.5, outAmp = 0.5, freqDiff = 1;
	var env, sig, sig2;
	sig = SinOsc.ar(freq, mul: amp_1);
	sig2 = SinOsc.ar(freq - freqDiff, mul: amp_2);

	Out.ar(0, Pan2.ar(sig + sig2, 0, outAmp));

}).add;
)


a = Synth(\nul, [\freq, 470, \freqDiff, 2, \amp_1, 0.5, \amp_2, 0.5, \outAmp, 0.6]);
a.set(\freq, 520, \freqDiff, 1);
a.set(\freq, 470, \freqDiff, 3);