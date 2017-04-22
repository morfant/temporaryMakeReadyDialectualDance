

// //Q: 정아씨 대야에 머리 박으면
// ~naration_32 = Synth(\tt, [\amp, 0.24]);
// ~naration_32.free;
//
// //Q: 선시씨 옷장들고 충분히 등장하면
// ~naration_book = Synth(\book, [\amp, 0.24]);
// ~naration_book.free;
//
// //Q: 주성씨가 탄 욕조가 무대에 나오면
// ~naration_forMe = Synth(\for, [\amp, 0.18]);
// ~naration_forMe.free;


// narration
//1. 책장 듀엣 다운
~masterEQ.gui.onSelect('narration');~na1_Syn = Synth(\na1, [\amp, 2.5]);
~na1_Syn.free;

//2. 메트리스 in
~t.stop;~a.stop;
~masterEQ.gui.onSelect('narration');~na2_Syn = Synth(\na2, [\amp, 1.8]);
~na2_Syn.free;

//3. 스피커 in
~masterEQ.gui.onSelect('narration');~na3_Syn = Synth(\na3, [\amp, 1.4]);
~na3_Syn.free;


// 서른즈음에 (2절 '점점더~' 부터)
//1. 페이드 인
~masterEQ.gui.onSelect('x_flat');~kim_song = Synth(\kim, [\amp, 0.3, \atTime, 20, \relTime, 10, \gate, 1]);

// 2. 페이드아웃
~kim_song.release(14);
