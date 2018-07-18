import java.io.File;
import java.io.FileInputStream;
import java.util.Scanner;

public class WaterTreatementPlant {
	public static void main(String[] args) throws Exception {
		
		File file = new File("config.txt");
		Scanner sc = new Scanner(file);
		
		int numberOfStations= sc.nextInt();
		
		Stations[] station = new Stations[numberOfStations];
		Pipe[] Pipes = new Pipe[station.length];
		for (int i = 0; i < Pipes.length; i++) {
			Pipes[i] = new Pipe();
		}
		for (int i = 0; i < station.length; i++) {
			Pipe inPipe = Pipes[i];
			inPipe.setPipeNumber(i);
			Pipe outPipe = Pipes[(i + 1) % Pipes.length];
			outPipe.setPipeNumber((i + 1) % Pipes.length);
			
			if(i==numberOfStations-1){
				station[i] = new Stations(inPipe, outPipe, sc.nextInt());
			}
			else
			station[i] = new Stations(outPipe, inPipe, sc.nextInt()); 
			
			Thread t = new Thread(station[i], "Station " + (i + 1));
			t.start();
		}
	}
}