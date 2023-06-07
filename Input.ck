// David Clarke - 121125392

fun void input() {
    // create Hid Object
    Hid hid;                  

    // message holder to inform on Hid data
    HidMsg msg;              

    // set keyboard device number
    0 => int device;         

    // if statement that opens keyboard and exits if failed
    if( !hid.openKeyboard( device ) ) me.exit();  

    // message printed if keybard active
    <<< "keyboard '" + hid.name() + "' active", "" >>>;

    // send TubeBell through reverb to dac
    TubeBell organ => PRCRev r => dac; 

    // infinite while loop
    while( true )
    {
        // hid waits for keyboard event
        hid => now;                    
        // loop every time key is pressed
        while( hid.recv( msg ) )       
        {
            // if button is pressed organ note is played
            if( msg.isButtonDown() )
            {                         
                Std.mtof( msg.ascii ) => organ.freq;
                // note is played
                1 => organ.noteOn;
            }
            else 
            {
                // note deactivated when button is let go
                0 => organ.noteOff;   
            }
            
        }
    }
}

spork ~ input();
300.0 :: second => now;