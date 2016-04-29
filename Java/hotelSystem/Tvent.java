
public class Tvent implements Interval {
	private long Start;
	private long End;

	public Tvent(long start, long end) {
		Start = start;
		End = end;

	}

	@Override
	public int compareTo(Interval i) {
		// TODO Auto-generated method stub
		if (Start < i.getStart()) {
			return -1;
		} else {
			return 1;
		}
	}

	public boolean equals(Tvent e) {
		// TODO Remove this exception and implement the method
		if (Start == e.getStart()) {
			return true;
		} else {
			return false;

		}
	}
	@Override
	public long getStart() {
		// TODO Auto-generated method stub
		return Start;
	}

	@Override
	public long getEnd() {
		// TODO Auto-generated method stub
		return End;
	}

	@Override
	public boolean overlap(Interval i) {
		// TODO Auto-generated method stub
		if ((Start > i.getStart() && Start < i.getEnd()) || (End > i.getStart() && End < i.getEnd())) {
			return true;
		} else {
			return false;
		}
	}

}
