{SinOsc.ar(300)!2}.play;

(
SynthDef.new(\t, {
	arg freq = 10, amp = 1.0, dens = 10, outAmp = 1.0;

	var sig2 = Dust.kr(dens, 1);
	// var sig2 = Dust.kr(MouseY.kr(3, 2000, lag: 0.6), 1);
	var sig = LFTri.ar(freq, mul: sig2);
	// var sig = LFTri.ar(MouseX.kr(10, 6900, lag: 1.5), mul: sig2);

	// Out.ar(0, Pan2.ar(sig, 0, outAmp));
	Out.ar(0, Pan2.ar(sig, Dust2.kr(dens), outAmp));

}).add;
)


a = Synth(\t, [freq: [200, 40, 192], dens: 600 ]);
b = Synth("t", [\freq, 100, \dens, 4]);
c = Synth("t", [\freq, 6000, \dens, 600]);
b.set(\dens, 20, \freq, 4000);
b.set(\dens, 200, \freq, 4000);

a.set(\dens, 10, \freq, 6900);
a.set(\dens, 1000, \freq, 6900);

c.set(\dens, 4, \freq, 300);




// 김광석 노래 음높이에 비례하여 dens를 높이기 - 실제로는 마우스 컨트롤?


FreqScope.new()




{Dust.kr(30, 1)}.plot(1)




// 간단한 리프를 만들 수 있는 패턴(Pbind);



