# ChucK Project

Welcome to the ChucK Project repository! This project showcases the creative potential of the ChucK programming language by combining different musical elements to compose an immersive audio experience. By leveraging the power of ChucK, this project brings together drums, piano, bass, and user input to create a unique musical composition. Let's dive into the exciting features of each component:

## Getting Started

To use this ChucK project, follow the instructions below:

### Prerequisites

Before running the project, make sure you have the following installed:

- ChucK: The ChucK programming language environment. You can download it from the official ChucK website at [https://chuck.cs.princeton.edu](https://chuck.cs.princeton.edu).

### Clone the Repository

Start by cloning this repository to your local machine using the following command:
git clone https://github.com/your-username/chuck-project.git

### Project Structure

After cloning the repository, you will find the following files and directories:

- `Drums.ck`: This script generates dynamic drum beats by utilizing SndBufs to play drum sound files. It includes features such as gain control, tempo settings, and random gain application for hats and cowbells.

- `Piano.ck`: The script for creating enchanting piano melodies. It utilizes the Wurley ugen with a 4-key parameter and includes a chord progression generator, precise note timing, and extended performance capabilities.

- `Bass.ck`: This script produces captivating basslines using the Mandolin ugen, incorporating reverb and string parameters. It features a MIDI-based array for note selection, dynamic scale movement, and rhythmic variation.

- `Solo.ck`: The script responsible for the expressive solo instrument. It utilizes the Rhodey ugen, applying reverb and delay effects. The script includes dynamic note selection, octave elevation, and a captivating solo performance.

- `Classes/`: This directory contains three custom classes that generate random notes from a set array of MIDI notes in the C Major scale. These classes can be used to introduce randomized musical elements in your compositions.

- `Input.ck`: This script enables user interaction with the composition through a human interface device. It integrates the TubeBell ugen, providing keyboard-based instrumentation and allowing users to shape the music in real-time.

- `Score.ck`: The script that orchestrates the execution of different ChucK files to create a cohesive composition. It ensures seamless integration of each musical component at the appropriate moments.

- `Init.ck`: The initialization script that serves as the entry point for running the composition. It calls the Score.ck script to start the musical experience.

### Running the Project

To run the ChucK project, follow these steps:

1. Open a terminal or command prompt.

2. Navigate to the project directory:
cd chuck-project

3. Start ChucK and load the Init.ck file:
chuck Init.ck

4. Sit back, relax, and enjoy the musical composition generated by the ChucK project or get involved by playing along using your keyboard.
