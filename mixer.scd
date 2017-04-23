(
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
)


// cmd .을 해도 적당한 위치에 나오도록 해야 한다.
~mixer = Synth(\mixer, [\amp_0, 1.0, \amp_1, 0.5,  \amp_2, 0.5,  \amp_3, 0.5 ]);


~mixer.set(\amp_0, 25.0);
~mixer.set(\amp_1, 5.0);
~mixer.set(\amp_2, 5.0);
~mixer.set(\amp_3, 5.0);

~mixer.free;


(

~win = Window.new.front;

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

)



