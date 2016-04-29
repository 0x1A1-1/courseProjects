
public class Tester {
	public static void main(String args[]) {
		int[] a={0,1,2,3,4,5,6,7,8};
		DoublyLinkedList<Integer> t=new DoublyLinkedList<Integer>();
		for (int i=0; i<a.length; i++){
			t.add(a[i]);
		}
		t.add(10,9);
		for (int i=0; i<t.size(); i++){
			System.out.print(t.get(i)+" ");
		}
		//System.out.print(t.getT());
	}
}
