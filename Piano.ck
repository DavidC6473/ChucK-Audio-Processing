// David Clarke - 121125392

fun void piano() {
    // Wurley keys that plays 4 notes
    Wurley keys[4];             

    // plays notes through different channels
    keys[0] => dac.left;        
    keys[1] => dac;             
    keys[2] => dac;             
    keys[3] => dac.right;       

    // I - V - vi - IV chord progression
    [[48,60,64,67],[55,67,71,33],[57,69,72,76],[53,65,69,72]] @=> int chords[][]; 



    while(true)                  
    {
        
        // chord 1
        for( 0 => int i; i < 4; i++ )
        {                          
            Std.mtof(chords[0][i]) => keys[i].freq;
            Math.random2f(0.3,.7) => keys[i].noteOn;
        }
        1.0 :: second => now;
        
        // chord 2
        for( 0 => int i; i < 4; i++ )
        {                          
            Math.mtof(chords[1][i]) => keys[i].freq;
            Math.random2f(0.3,.7) => keys[i].noteOn;
        }
        1.0 :: second => now;
        
        // chord 3
        for( 0 => int i; i < 4; i++ )
        {                          
            Math.mtof(chords[2][i]) => keys[i].freq;
            Math.random2f(0.3,.7) => keys[i].noteOn;
        }
        1.0 :: second => now;
        
        // chord 4
        for( 0 => int i; i < 4; i++ )
        {                          
            Math.mtof(chords[3][i]) => keys[i].freq;
            Math.random2f(0.3,.7) => keys[i].noteOn;
        }
        
        1.0 :: second => now;
    }
}

spork ~ piano();
300.0 :: second => now;