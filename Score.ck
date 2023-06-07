// David Clarke - 121125392

// add class2
Machine.add(me.dir() + "/Class2.ck") => int class2ID;

// add keyboard input
Machine.add(me.dir() + "/Input.ck") => int inputID;

// add piano
Machine.add(me.dir() + "/Piano.ck") => int pianoID;
// wait 8 seconds
8.0::second => now;

// add class1
Machine.add(me.dir() + "/Class1.ck") => int class1ID;

// add bass
Machine.add(me.dir() + "/Bass.ck") => int bassID;

// add drums
Machine.add(me.dir() + "/Drums.ck") => int drumsID;
// wait 20 seconds
20.0::second => now;

// add solo
Machine.add(me.dir() + "/Solo.ck") => int soloID;
// wait 272 seconds
272.0::second => now;

//add class3
Machine.add(me.dir() + "/Class3.ck") => int class3ID;