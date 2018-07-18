import java.util.concurrent.locks.ReentrantLock;

public class Stations implements Runnable {
	private final Pipe inPipe;
	private final Pipe outPipe;
	private int workload;
	ReentrantLock inLock = new ReentrantLock();
	ReentrantLock outLock = new ReentrantLock();
	Stations(Pipe in, Pipe out, int workload) {
		this.inPipe = in;
		this.outPipe = out;
		this.workload = workload;
	}

	private void doWork(String action) throws InterruptedException {
		System.out.println(Thread.currentThread().getName() + " " + action);
		Thread.sleep(((int) (Math.random() * 100)));
	}
	
	private void decreamentWorkLoad(){
		this.workload--;
	}

	@Override
	public void run() {
		try {
			while (true) {
				doWork(": --------------------------------------------------------------");
				synchronized (inPipe) {
					doWork(": Granted Access : In-pipe : "+this.inPipe.getPipeNumber());
					synchronized (outPipe) {
						doWork(": Granted Access : Out-pipe : "+this.outPipe.getPipeNumber()); 
						if(workload>=0)
							doWork("Water is flowing Successfully; WorkLoad "+workload);
							doWork(": Released access : out-pipe : "+this.outPipe.getPipeNumber());
						decreamentWorkLoad();
					}
					doWork(": Released access : In-pipe : "+this.inPipe.getPipeNumber());
					isWorkDone();
				}
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}

	/*
	@Override
	public void run() {
		try {
			while (true) {
				doWork(": Initiating Pipelining");
				inLock.lock();
					doWork(": Granted Access : In-pipe : "+this.inPipe.getPipeNumber());
					outLock.lock();
						doWork(": Granted Access : Out-pipe : "+this.outPipe.getPipeNumber()); 
						if(workload>=0)
						doWork("Water is flowing Successfully; WorkLoad "+workload);
						doWork(": Released access : out-pipe : "+this.outPipe.getPipeNumber());
						decreamentWorkLoad();
						outLock.lock();
					doWork(": Released access : In-pipe."+this.inPipe.getPipeNumber());
					isWorkDone();
				inLock.unlock();
			}
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
		}
	}
	*/
	private void isWorkDone() {
		if(workload==0){
			Thread.currentThread().stop();
		}		
	}
}