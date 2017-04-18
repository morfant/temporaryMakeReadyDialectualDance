//---------------------------- 1 ----------------------------
// buffers
(
~tt = Buffer.read(s, "/Users/giy/Desktop/TMRDD/32.aiff");
// ~tt.play;

~for = Buffer.read(s, "/Users/giy/Desktop/TMRDD/forme.aiff");
// ~for.play;

~book = Buffer.read(s, "/Users/giy/Desktop/TMRDD/book.aiff");
// ~book.play;

)



//---------------------------- 2 ----------------------------
(
SynthDef(\tt, //thirty two
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
}).add;

)


//Q: 정아씨 대야에 머리 박으면
~naration_32 = Synth(\tt, [\amp, 0.24]);
~naration_32.free;

//Q: 선시씨 옷장들고 충분히 등장하면
~naration_book = Synth(\book, [\amp, 0.24]);
~naration_book.free;

//Q: 주성씨가 탄 욕조가 무대에 나오면
~naration_forMe = Synth(\for, [\amp, 0.18]);
~naration_forMe.free;



